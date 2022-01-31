part of 'settings_bloc.dart';

@immutable
abstract class SettingsState extends Equatable {
  const SettingsState(
      {this.uiLocale = const Locale('en'),
      this.uiThemeMode = ThemeMode.system});

  final Locale uiLocale;
  final ThemeMode uiThemeMode;

  /*SettingsState copyWith({
    Locale? uiLocale,
    ThemeMode? uiThemeMode,
  }) {
    return SettingsState(
        uiLocale: uiLocale ?? this.uiLocale,
        uiThemeMode: uiThemeMode ?? this.uiThemeMode);
  }*/

  @override
  List<Object> get props => [
        uiLocale,
        uiThemeMode,
      ];
}

class SettingsInitial extends SettingsState {}

class SettingsStateUILocaleChanged extends SettingsState {
  const SettingsStateUILocaleChanged(Locale uiLocale)
      : super(uiLocale: uiLocale);
}

class SettingsStateUIThemeModeChanged extends SettingsState {
  const SettingsStateUIThemeModeChanged(ThemeMode uiThemeMode)
      : super(uiThemeMode: uiThemeMode);
}
