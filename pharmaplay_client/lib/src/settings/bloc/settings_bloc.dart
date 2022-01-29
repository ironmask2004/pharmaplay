import 'package:bloc/bloc.dart';
import 'package:flutter/painting.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:pharmaplay_client/src/utlites/shared_pref.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitial()) {
    on<SettingsEvent>((event, emit) {
      on<UIThemeModeChanged>(_onUIThemeModeChanged);
      on<UILocalChanged>(_onUILocalChanged);
      on<ReloadUILocaleRequsted>(_onReloadUILocaleRequsted);
      on<ReloadUIThemeModeRequsted>(_onReloadUIThemeModeRequsted);
    });
  }

  /// Loads the User's preferred ThemeMode from local or remote storage.
  Future<void> _onReloadUIThemeModeRequsted(
    ReloadUIThemeModeRequsted event,
    Emitter<SettingsState> emit,
  ) async {
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
    emit(SettingsStateUIThemeModeChanged(currentThemeMode));
  }

  Future<void> _onReloadUILocaleRequsted(
    ReloadUILocaleRequsted event,
    Emitter<SettingsState> emit,
  ) async {
    String currentLocale =
        await MySharedPreferences.instance.getStringValue("UILocale");
    emit(SettingsStateUILocaleChanged(
        Locale(currentLocale == 'ar' 'ar' ? 'ar' : 'en')));
  }

  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> _onUIThemeModeChanged(
    UIThemeModeChanged event,
    Emitter<SettingsState> emit,
  ) async {
    // Use the shared_preferences package to persist settings locally or the
    // http package to persist settings over the network.
    await MySharedPreferences.instance
        .setStringValue("ThemeMode", state.uiThemeMode.name);
  }

  Future<void> _onUILocalChanged(
    UILocalChanged event,
    Emitter<SettingsState> emit,
  ) async {
    await MySharedPreferences.instance
        .setStringValue("UILocale", state.uiLocale.languageCode);
    emit(SettingsStateUILocaleChanged(event.uiLocale));
  }
}
