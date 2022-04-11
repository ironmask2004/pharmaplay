part of 'settings_bloc.dart';

@immutable
class SettingsState extends Equatable {
  const SettingsState(
      {this.localeUI = const Locale('en'),
      this.uiThemeMode = ThemeMode.system});

  final Locale localeUI;
  final ThemeMode uiThemeMode;

  SettingsState copyWith({
    Locale? localeUI,
    ThemeMode? uiThemeMode,
  }) {
    return SettingsState(
        localeUI: localeUI ?? this.localeUI,
        uiThemeMode: uiThemeMode ?? this.uiThemeMode);
  }

  @override
  List<Object> get props => [
        localeUI,
        uiThemeMode,
      ];
}

class SettingsInitial extends SettingsState {}

/*class SettingsStatelocaleUIChanged extends SettingsState {
  const SettingsStatelocaleUIChanged(Locale localeUI)
      : super(localeUI: localeUI);
}

class SettingsStateUIThemeModeChanged extends SettingsState {
  const SettingsStateUIThemeModeChanged(ThemeMode uiThemeMode)
      : super(uiThemeMode: uiThemeMode);
}
*/
