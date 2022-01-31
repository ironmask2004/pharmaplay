part of 'settings_bloc.dart';

@immutable
abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class UILocalChanged extends SettingsEvent {
  const UILocalChanged(this.uiLocale);

  final Locale uiLocale;

  @override
  List<Object> get props => [uiLocale];
}

class UIThemeModeChanged extends SettingsEvent {
  const UIThemeModeChanged(this.uiThemeMode);

  final ThemeMode uiThemeMode;

  @override
  List<Object> get props => [uiThemeMode];
}

class SettingsInitialRequested extends SettingsEvent {}

class ReloadUILocaleRequsted extends SettingsEvent {}

class ReloadUIThemeModeRequsted extends SettingsEvent {}
