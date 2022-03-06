import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

import 'package:pharmaplay_client/src/utlites/shared_pref.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashBoardBloc extends Bloc<DashBoardEvent, DashBoardState> {
  DashBoardBloc() : super(const DashBoardInitial()) {
    on<DashBoardInitialRequested>(_onDashBoardInitialRequested);
    on<SideMenuClicked>(_onSideMenuClicked);
    on<RightMenuClicked>(_onRightMenuClicked);
    on<UILocalChanged>(_onUILocalChanged);

    on<UIThemeModeChanged>(_onUIThemeModeChanged);
    on<NotifyState>(_onNotifyState);

    on<ReloadlocaleUIRequsted>(_onReloadlocaleUIRequsted);
    on<ReloadUIThemeModeRequsted>(_onReloadUIThemeModeRequsted);
    on<HeaderSerachFieldChanged>(_onHeaderSerachFieldChanged);
    on<HeaderSerachSubmitted>(_onHeaderSerachSubmitted);
    on<InitSubBlocs>(_onInitSubBlocs);
  }

  Future<void> _onSideMenuClicked(
    SideMenuClicked event,
    Emitter<DashBoardState> emit,
  ) async {
    if (!Scaffold.of(event.context).isDrawerOpen) {
      Scaffold.of(event.context).openDrawer();
    }
  }

//====

  Future<void> _onNotifyState(
    NotifyState event,
    Emitter<DashBoardState> emit,
  ) async {
    emit(state.copyWith());
  }

//===

  Future<void> _onRightMenuClicked(
    RightMenuClicked event,
    Emitter<DashBoardState> emit,
  ) async {
    if (!Scaffold.of(event.context).isEndDrawerOpen) {
      Scaffold.of(event.context).openEndDrawer();
    }
  }
//TODO convert colors theme to class

  Future<void> _onDashBoardInitialRequested(
    DashBoardInitialRequested event,
    Emitter<DashBoardState> emit,
  ) async {
    ThemeMode currentThemeMode;
    String savedThemeMode =
        await MySharedPreferences.instance.getStringValue("ThemeMode");

    Color primaryColor = Color(
        await MySharedPreferences.instance.getIntegerValue("primaryColor"));
    Color secondaryColor = Color(
        await MySharedPreferences.instance.getIntegerValue("secondaryColor"));
    Color bgColor =
        Color(await MySharedPreferences.instance.getIntegerValue("bgColor"));
    Color fontbodyColor = Color(
        await MySharedPreferences.instance.getIntegerValue("fontbodyColor"));
    //emit(DashBoardStateUIThemeModeChanged(currentThemeMode));
    print('''----------initial Color-----------

        primaryColor: $primaryColor,
        secondaryColor: $secondaryColor,
        bgColor: $bgColor,
        fontbodyColor: $fontbodyColor
        ---------
        ''');

    primaryColor = primaryColor != Color(0x00000000)
        ? primaryColor
        : const Color(0xFF2697FF);

    secondaryColor = secondaryColor != Color(0x00000000)
        ? secondaryColor
        : const Color(0xFFA0CFFC);

    bgColor = bgColor != Color(0x00000000) ? bgColor : const Color(0xFF212332);

    fontbodyColor = fontbodyColor != Color(0x00000000)
        ? fontbodyColor
        : const Color(0xFF3390EC);

    switch (savedThemeMode) {
      case 'light':
        currentThemeMode = ThemeMode.light;
        break;
      case 'dark':
        currentThemeMode = ThemeMode.dark;
        break;
      default:
        currentThemeMode = ThemeMode.dark;
    }
    print('emit UITHemeChanged' + currentThemeMode.toString());

    //emit(DashBoardStateUIThemeModeChanged(currentThemeMode));

    emit(state.copyWith(
        status: 'UITHemeChanged',
        uiThemeMode: currentThemeMode,
        primaryColor: primaryColor,
        secondaryColor: secondaryColor,
        bgColor: bgColor,
        fontbodyColor: fontbodyColor));

    print('DashBoardInitialRequested !!!');

    String currentLocale =
        await MySharedPreferences.instance.getStringValue("localeUI");

    print('emit DashBoardStatelocaleUIChanged ' + currentLocale);
    // emit(DashBoardStatelocaleUIChanged(
    //    Locale(currentLocale == 'ar' ? 'ar' : 'en')));
    await Future.delayed(Duration(seconds: 1));
    emit(state.copyWith(
        status: 'localeUIChanged',
        localeUI: Locale(currentLocale == 'ar' ? 'ar' : 'en')));
    print(
        ' -----------------  state localeUI : ' + state.localeUI.languageCode);

    add(InitSubBlocs());
  }

  void _onInitSubBlocs(
    InitSubBlocs event,
    Emitter<DashBoardState> emit,
  ) async {
    print('_onInitSubBlocs');
    emit(state.copyWith(status: 'InitSubBlocs', localeUI: state.localeUI));
  }

  /// Loads the User's preferred ThemeMode from local or remote storage.
  Future<void> _onReloadUIThemeModeRequsted(
    ReloadUIThemeModeRequsted event,
    Emitter<DashBoardState> emit,
  ) async {
    print('_onReloadUIThemeModeRequsted!!');
    //=> ThemeMode.system;
    ThemeMode currentThemeMode;
    String savedThemeMode =
        await MySharedPreferences.instance.getStringValue("ThemeMode");

    Color primaryColor = Color(
        await MySharedPreferences.instance.getIntegerValue("primaryColor"));
    Color secondaryColor = Color(
        await MySharedPreferences.instance.getIntegerValue("secondaryColor"));
    Color bgColor =
        Color(await MySharedPreferences.instance.getIntegerValue("bgColor"));
    Color fontbodyColor = Color(
        await MySharedPreferences.instance.getIntegerValue("fontbodyColor"));

    switch (savedThemeMode) {
      case 'light':
        currentThemeMode = ThemeMode.light;
        break;
      case 'dark':
        currentThemeMode = ThemeMode.dark;
        break;
      default:
        currentThemeMode = ThemeMode.system;
    }
    print('emit UITHemeChanged' + currentThemeMode.toString());

    //emit(DashBoardStateUIThemeModeChanged(currentThemeMode));

    emit(state.copyWith(
        status: 'UITHemeChanged',
        uiThemeMode: currentThemeMode,
        primaryColor: primaryColor,
        secondaryColor: secondaryColor,
        bgColor: bgColor,
        fontbodyColor: fontbodyColor));
  }

//===========

  void _onHeaderSerachFieldChanged(
    HeaderSerachFieldChanged event,
    Emitter<DashBoardState> emit,
  ) {
    print('_onHeaderSerachFieldChanged');
    emit(state.copyWith(
      status: 'HeaderSerachFieldChanged',
      headerSerachField: event.headerSerachField,
    ));
  }

  void _onHeaderSerachSubmitted(
    HeaderSerachSubmitted event,
    Emitter<DashBoardState> emit,
  ) async {
    try {
      print('_onHeaderSerachSubmitted headerSerachField:====' +
          state.headerSerachField);
    } catch (err) {
      print('Error connectiing to server ' + err.toString());
      rethrow;
      // showInSnackBar(context, err.toString());
    }
  }

  //=======================

  Future<void> _onReloadlocaleUIRequsted(
    ReloadlocaleUIRequsted event,
    Emitter<DashBoardState> emit,
  ) async {
    print('_onReloadlocaleUIRequsted!!');
    String currentLocale =
        await MySharedPreferences.instance.getStringValue("localeUI");
    print('  state localeUI : ' + state.localeUI.languageCode);
    print('emit DashBoardStatelocaleUIChanged ' + currentLocale);
    emit(state.copyWith(
      status: 'localeUIChanged',
      localeUI: Locale(currentLocale == 'ar' ? 'ar' : 'en'),
    ));

    ///  emit(DashBoardStatelocaleUIChanged(
    //    Locale(currentLocale == 'ar' ? 'ar' : 'en')));
  }

  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> _onUIThemeModeChanged(
    UIThemeModeChanged event,
    Emitter<DashBoardState> emit,
  ) async {
    //  if (event.uiThemeMode == null) return;

    // Dot not perform any work if new and old ThemeMode are identical
    if (event.uiThemeMode == state.uiThemeMode) return;

    print('_onUIThemeModeChanged: ' + event.uiThemeMode.toString());
    await MySharedPreferences.instance
        .setStringValue("ThemeMode", event.uiThemeMode.name);

    switch (event.uiThemeMode) {
      case ThemeMode.dark:
        {
          print('Change to Dark MODE --------------' +
              Color(0xFF2697FF).value.toString() +
              int.parse(Color(0xFF2697FF).value.toString()).toString());
          ;
          await MySharedPreferences.instance
              .setIntegerValue("primaryColor", const Color(0xFF2697FF).value);

          await MySharedPreferences.instance
              .setIntegerValue("secondaryColor", Color(0xFF2A2D3E).value);
          await MySharedPreferences.instance
              .setIntegerValue("bgColor", Color(0xFF212332).value);
          await MySharedPreferences.instance
              .setIntegerValue("fontbodyColor", Color(0xFF71CAE6).value);

          emit(state.copyWith(
              status: 'UIThemeModeChanged',
              uiThemeMode: event.uiThemeMode,
              primaryColor: Color(0xFF2697FF),
              secondaryColor: const Color(0xFF2A2D3E),
              bgColor: const Color(0xFF212332),
              fontbodyColor: Color(0xFF71CAE6)));
        }
        break;
      case ThemeMode.light:
        {
          print('Change to Mode Light --------------' +
              Color(0xFF294966).value.toString() +
              int.parse(Color(0xFF294966).value.toString()).toString());

          await MySharedPreferences.instance.setIntegerValue(
              "primaryColor", Color.fromARGB(255, 98, 164, 225).value);
          await MySharedPreferences.instance
              .setIntegerValue("secondaryColor", Color(0xFFA0CFFC).value);
          await MySharedPreferences.instance
              .setIntegerValue("bgColor", Color(0xFFCDE1FF).value);
          await MySharedPreferences.instance
              .setIntegerValue("fontbodyColor", Color(0xFF020D18).value);

          emit(state.copyWith(
              status: 'UIThemeModeChanged',
              uiThemeMode: event.uiThemeMode,
              primaryColor: Color(0xFF294966),
              secondaryColor: Color(0xFFA0CFFC),
              bgColor: Color(0xFFCDE1FF),
              fontbodyColor: Color(0xFF020D18)));
        }
        break;
      case ThemeMode.system:
        {
          print('Change to System MODE --------------' +
              Color(0xFF294966).value.toString());
          await MySharedPreferences.instance
              .setIntegerValue("primaryColor", Color(0xFF294966).value);
          await MySharedPreferences.instance
              .setIntegerValue("secondaryColor", Color(0xFFCDC8FF).value);
          await MySharedPreferences.instance
              .setIntegerValue("bgColor", Color(0xFFCDE1FF).value);
          await MySharedPreferences.instance
              .setIntegerValue("fontbodyColor", Color(0xFF020D18).value);

          emit(state.copyWith(
              status: 'UIThemeModeChanged',
              uiThemeMode: event.uiThemeMode,
              primaryColor: Color(0xFF294966),
              secondaryColor: Color(0xFFCDC8FF),
              bgColor: Color(0xFFCDE1FF),
              fontbodyColor: Color(0xFF020D18)));
        }
    }
  }

  Future<void> _onUILocalChanged(
    UILocalChanged event,
    Emitter<DashBoardState> emit,
  ) async {
    print('new Locale: ' +
        event.localeUI.languageCode +
        ' OLD LocLE : + ' +
        state.localeUI.languageCode);
    // Dot not perform any work if new and old ThemeMode are identical
    if (event.localeUI.languageCode == state.localeUI.languageCode) return;

    await MySharedPreferences.instance
        .setStringValue("localeUI", event.localeUI.languageCode);
    print('emit DashBoardStatelocaleUIChanged   form ' +
        state.localeUI.languageCode +
        ' to ' +
        event.localeUI.languageCode);

    //  emit(DashBoardStatelocaleUIChanged(event.localeUI)
    // state.copyWith(localeUI: event.localeUI),
    //  );
    emit(state.copyWith(status: 'localeUIChanged', localeUI: event.localeUI));
  }
}
