import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

import 'package:pharmaplay_client/src/utlites/shared_pref.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashBoardBloc extends Bloc<DashBoardEvent, DashBoardState> {
  DashBoardBloc()
      : super(DashBoardInitial(scaffoldKey: GlobalKey<ScaffoldState>())) {
    on<DashBoardInitialRequested>(_onDashBoardInitialRequested);
    on<SideMenuClicked>(_onSideMenuClicked);
    on<RightMenuClicked>(_onRightMenuClicked);
    on<UILocalChanged>(_onUILocalChanged);
    on<ReloadUILocaleRequsted>(_onReloadUILocaleRequsted);
    on<ReloadUIThemeModeRequsted>(_onReloadUIThemeModeRequsted);
  }

  Future<void> _onSideMenuClicked(
    SideMenuClicked event,
    Emitter<DashBoardState> emit,
  ) async {
    if (!state.scaffoldKey.currentState!.isDrawerOpen) {
      state.scaffoldKey.currentState!.openDrawer();
    }
  }

  Future<void> _onRightMenuClicked(
    RightMenuClicked event,
    Emitter<DashBoardState> emit,
  ) async {
    if (!state.scaffoldKey.currentState!.isEndDrawerOpen) {
      state.scaffoldKey.currentState!.openEndDrawer();
    }
  }

  Future<void> _onDashBoardInitialRequested(
    DashBoardInitialRequested event,
    Emitter<DashBoardState> emit,
  ) async {
    ThemeMode currentThemeMode;
    String savedThemeMode =
        await MySharedPreferences.instance.getStringValue("ThemeMode");
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

    //  emit(DashBoardStateUIThemeModeChanged(currentThemeMode));
    //emit(DashBoardState(currentThemeMode));
    emit(state.copyWith(uiThemeMode: currentThemeMode));

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

    emit(state.copyWith(uiThemeMode: currentThemeMode));
  }

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

    // Otherwise, store the new theme mode in memory
    // Use the shared_preferences package to persist dashboard locally or the
    // http package to persist dashboard over the network.
    print('_onUIThemeModeChanged: ' + event.uiThemeMode.toString());
    await MySharedPreferences.instance
        .setStringValue("ThemeMode", event.uiThemeMode.name);

    emit(state.copyWith(uiThemeMode: event.uiThemeMode));
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
