import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:pharmaplay_cpanel/src/utlites/shared_pref.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc1 extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc1() : super(SettingsInitial()) {
    on<SettingsInitialRequested>(_onSettingsInitialRequested);
    on<UIThemeModeChanged>(_onUIThemeModeChanged);
    on<UILocalChanged>(_onUILocalChanged);
    on<ReloadlocaleUIRequsted>(_onReloadlocaleUIRequsted);
    on<ReloadUIThemeModeRequsted>(_onReloadUIThemeModeRequsted);
  }

  Future<void> _onSettingsInitialRequested(
    SettingsInitialRequested event,
    Emitter<SettingsState> emit,
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

    //  emit(SettingsStateUIThemeModeChanged(currentThemeMode));
    //emit(SettingsState(currentThemeMode));
    emit(state.copyWith(uiThemeMode: currentThemeMode));

    print('SettingsInitialRequested !!!');
    String currentLocale =
        await MySharedPreferences.instance.getStringValue("localeUI");

    print('emit SettingsStatelocaleUIChanged ' + currentLocale);
    // emit(SettingsStatelocaleUIChanged(
    //    Locale(currentLocale == 'ar' ? 'ar' : 'en')));
    emit(state.copyWith(localeUI: Locale(currentLocale == 'ar' ? 'ar' : 'en')));
    print('  state localeUI : ' + state.localeUI.languageCode);
  }

  /// Loads the User's preferred ThemeMode from local or remote storage.
  Future<void> _onReloadUIThemeModeRequsted(
    ReloadUIThemeModeRequsted event,
    Emitter<SettingsState> emit,
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

    //emit(SettingsStateUIThemeModeChanged(currentThemeMode));

    emit(state.copyWith(uiThemeMode: currentThemeMode));
  }

  Future<void> _onReloadlocaleUIRequsted(
    ReloadlocaleUIRequsted event,
    Emitter<SettingsState> emit,
  ) async {
    print('_onReloadlocaleUIRequsted!!');
    String currentLocale =
        await MySharedPreferences.instance.getStringValue("localeUI");
    print('  state localeUI : ' + state.localeUI.languageCode);
    print('emit SettingsStatelocaleUIChanged ' + currentLocale);
    emit(state.copyWith(
      localeUI: Locale(currentLocale == 'ar' ? 'ar' : 'en'),
    ));

    ///  emit(SettingsStatelocaleUIChanged(
    //    Locale(currentLocale == 'ar' ? 'ar' : 'en')));
  }

  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> _onUIThemeModeChanged(
    UIThemeModeChanged event,
    Emitter<SettingsState> emit,
  ) async {
    //  if (event.uiThemeMode == null) return;

    // Dot not perform any work if new and old ThemeMode are identical
    if (event.uiThemeMode == state.uiThemeMode) return;

    // Otherwise, store the new theme mode in memory
    // Use the shared_preferences package to persist settings locally or the
    // http package to persist settings over the network.
    print('_onUIThemeModeChanged: ' + event.uiThemeMode.toString());
    await MySharedPreferences.instance
        .setStringValue("ThemeMode", event.uiThemeMode.name);

    emit(state.copyWith(uiThemeMode: event.uiThemeMode));
  }

  Future<void> _onUILocalChanged(
    UILocalChanged event,
    Emitter<SettingsState> emit,
  ) async {
    print('new Locale: ' +
        event.localeUI.languageCode +
        ' OLD LocLE : + ' +
        state.localeUI.languageCode);
    // Dot not perform any work if new and old ThemeMode are identical
    if (event.localeUI.languageCode == state.localeUI.languageCode) return;

    await MySharedPreferences.instance
        .setStringValue("localeUI", event.localeUI.languageCode);
    print('emit SettingsStatelocaleUIChanged   form ' +
        state.localeUI.languageCode +
        ' to ' +
        event.localeUI.languageCode);

    //  emit(SettingsStatelocaleUIChanged(event.localeUI)
    // state.copyWith(localeUI: event.localeUI),
    //  );
    emit(state.copyWith(localeUI: event.localeUI));
  }
}
