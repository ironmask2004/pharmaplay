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

    on<ReloadUILocaleRequsted>(_onReloadUILocaleRequsted);
    on<ReloadUIThemeModeRequsted>(_onReloadUIThemeModeRequsted);
    on<HeaderSerachFieldChanged>(_onHeaderSerachFieldChanged);
    on<HeaderSerachSubmitted>(_onHeaderSerachSubmitted);
  }

  Future<void> _onSideMenuClicked(
    SideMenuClicked event,
    Emitter<DashBoardState> emit,
  ) async {
    if (!Scaffold.of(event.context).isDrawerOpen) {
      Scaffold.of(event.context).openDrawer();
    }
  }

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
        : const Color(0xFF2A2D3E);

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
        uiThemeMode: currentThemeMode,
        primaryColor: primaryColor,
        secondaryColor: secondaryColor,
        bgColor: bgColor,
        fontbodyColor: fontbodyColor));

    print('DashBoardInitialRequested !!!');

    String currentLocale =
        await MySharedPreferences.instance.getStringValue("UILocale");

    print('emit DashBoardStateUILocaleChanged ' + currentLocale);
    // emit(DashBoardStateUILocaleChanged(
    //    Locale(currentLocale == 'ar' ? 'ar' : 'en')));
    emit(state.copyWith(uiLocale: Locale(currentLocale == 'ar' ? 'ar' : 'en')));
    print('  state uiLocale : ' + state.uiLocale.languageCode);
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

  Future<void> _onReloadUILocaleRequsted(
    ReloadUILocaleRequsted event,
    Emitter<DashBoardState> emit,
  ) async {
    print('_onReloadUILocaleRequsted!!');
    String currentLocale =
        await MySharedPreferences.instance.getStringValue("UILocale");
    print('  state uiLocale : ' + state.uiLocale.languageCode);
    print('emit DashBoardStateUILocaleChanged ' + currentLocale);
    emit(state.copyWith(
      uiLocale: Locale(currentLocale == 'ar' ? 'ar' : 'en'),
    ));

    ///  emit(DashBoardStateUILocaleChanged(
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

          await MySharedPreferences.instance
              .setIntegerValue("primaryColor", Color(0xFF294966).value);
          await MySharedPreferences.instance
              .setIntegerValue("secondaryColor", Color(0xFFCDC8FF).value);
          await MySharedPreferences.instance
              .setIntegerValue("bgColor", Color(0xFFCDE1FF).value);
          await MySharedPreferences.instance
              .setIntegerValue("fontbodyColor", Color(0xFF020D18).value);

          emit(state.copyWith(
              uiThemeMode: event.uiThemeMode,
              primaryColor: Color(0xFF294966),
              secondaryColor: Color(0xFFCDC8FF),
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
        event.uiLocale.languageCode +
        ' OLD LocLE : + ' +
        state.uiLocale.languageCode);
    // Dot not perform any work if new and old ThemeMode are identical
    if (event.uiLocale.languageCode == state.uiLocale.languageCode) return;

    await MySharedPreferences.instance
        .setStringValue("UILocale", event.uiLocale.languageCode);
    print('emit DashBoardStateUILocaleChanged   form ' +
        state.uiLocale.languageCode +
        ' to ' +
        event.uiLocale.languageCode);

    //  emit(DashBoardStateUILocaleChanged(event.uiLocale)
    // state.copyWith(uiLocale: event.uiLocale),
    //  );
    emit(state.copyWith(uiLocale: event.uiLocale));
  }
}
