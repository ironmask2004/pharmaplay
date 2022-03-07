import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:pharmaplay_client/src/dashboard/models/pharmatheme.dart';

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

  Future<void> _onDashBoardInitialRequested(
    DashBoardInitialRequested event,
    Emitter<DashBoardState> emit,
  ) async {
    //emit(DashBoardStateUIThemeModeChanged(currentThemeMode));
    PharmaTheme savedPharmTheme =
        await PharmaTheme.createPharmaTheme(mode: ThemeMode.dark)
            .loadPharmaTheme();
    emit(state.copyWith(
        status: 'UITHemeChanged',
        uiThemeMode: savedPharmTheme.uiThemeMode,
        primaryColor: savedPharmTheme.primaryColor,
        secondaryColor: savedPharmTheme.secondaryColor,
        bgColor: savedPharmTheme.bgColor,
        fontbodyColor: savedPharmTheme.fontbodyColor));

    print('DashBoardInitialRequested !!!');

    String currentLocale =
        await MySharedPreferences.instance.getStringValue("localeUI");

    print('emit DashBoardStatelocaleUIChanged ' + currentLocale);
    // emit(DashBoardStatelocaleUIChanged(
    //    Locale(currentLocale == 'ar' ? 'ar' : 'en')));
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
    PharmaTheme savedPharmTheme =
        await PharmaTheme.createPharmaTheme(mode: ThemeMode.dark)
            .loadPharmaTheme();
    emit(state.copyWith(
        status: 'UITHemeChanged',
        uiThemeMode: savedPharmTheme.uiThemeMode,
        primaryColor: savedPharmTheme.primaryColor,
        secondaryColor: savedPharmTheme.secondaryColor,
        bgColor: savedPharmTheme.bgColor,
        fontbodyColor: savedPharmTheme.fontbodyColor));
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
    if (event.uiThemeMode == state.uiThemeMode) return;

    print('_onUIThemeModeChanged: ' + event.uiThemeMode.toString());

    PharmaTheme savedPharmTheme =
        PharmaTheme.createPharmaTheme(mode: event.uiThemeMode);
    await savedPharmTheme.saveToShaerdPref();
    emit(state.copyWith(
        status: 'UITHemeChanged',
        uiThemeMode: savedPharmTheme.uiThemeMode,
        primaryColor: savedPharmTheme.primaryColor,
        secondaryColor: savedPharmTheme.secondaryColor,
        bgColor: savedPharmTheme.bgColor,
        fontbodyColor: savedPharmTheme.fontbodyColor));
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
