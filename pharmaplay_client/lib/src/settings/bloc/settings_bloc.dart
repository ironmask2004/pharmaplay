import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:pharmaplay_client/src/utlites/shared_pref.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitial()) {
    on<SettingsInitialRequested>(_onSettingsInitialRequested);
    on<UIThemeModeChanged>(_onUIThemeModeChanged);
    on<UILocalChanged>(_onUILocalChanged);
    on<ReloadUILocaleRequsted>(_onReloadUILocaleRequsted);
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

    emit(SettingsStateUIThemeModeChanged(currentThemeMode));

    print('SettingsInitialRequested !!!');
    String currentLocale =
        await MySharedPreferences.instance.getStringValue("UILocale");

    print('emit SettingsStateUILocaleChanged ' + currentLocale);
    emit(SettingsStateUILocaleChanged(
        Locale(currentLocale == 'ar' ? 'ar' : 'en')));
    print('  state uiLocale : ' + state.uiLocale.languageCode);
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

    emit(SettingsStateUIThemeModeChanged(currentThemeMode));
    // emit(SettingsStateUIThemeModeChanged(currentThemeMode));
  }

  Future<void> _onReloadUILocaleRequsted(
    ReloadUILocaleRequsted event,
    Emitter<SettingsState> emit,
  ) async {
    print('_onReloadUILocaleRequsted!!');
    String currentLocale =
        await MySharedPreferences.instance.getStringValue("UILocale");
    print('  state uiLocale : ' + state.uiLocale.languageCode);
    print('emit SettingsStateUILocaleChanged ' + currentLocale);
    /*emit(
      state.copyWith(
        uiLocale: Locale(currentLocale == 'ar' ? 'ar' : 'en'),
      ),
    );*/
    emit(SettingsStateUILocaleChanged(
        Locale(currentLocale == 'ar' ? 'ar' : 'en')));
  }

  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> _onUIThemeModeChanged(
    UIThemeModeChanged event,
    Emitter<SettingsState> emit,
  ) async {
    // Use the shared_preferences package to persist settings locally or the
    // http package to persist settings over the network.
    print('--');
    await MySharedPreferences.instance
        .setStringValue("ThemeMode", event.uiThemeMode.name);
    emit(SettingsStateUIThemeModeChanged(event.uiThemeMode)
        // state.copyWith(uiLocale: event.uiLocale),
        );
  }

  Future<void> _onUILocalChanged(
    UILocalChanged event,
    Emitter<SettingsState> emit,
  ) async {
    await MySharedPreferences.instance
        .setStringValue("UILocale", event.uiLocale.languageCode);
    print('emit SettingsStateUILocaleChanged   form ' +
        state.uiLocale.languageCode +
        ' to ' +
        event.uiLocale.languageCode);

    emit(SettingsStateUILocaleChanged(event.uiLocale)
        // state.copyWith(uiLocale: event.uiLocale),
        );
  }
}
