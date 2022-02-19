part of 'mainboard_bloc.dart';

@immutable
class MainboardState extends Equatable {
  const MainboardState(
      {this.uiLocale = const Locale('en'),
      this.uiThemeMode = ThemeMode.system});

  final Locale uiLocale;
  final ThemeMode uiThemeMode;

  MainboardState copyWith({
    Locale? uiLocale,
    ThemeMode? uiThemeMode,
  }) {
    return MainboardState(
        uiLocale: uiLocale ?? this.uiLocale,
        uiThemeMode: uiThemeMode ?? this.uiThemeMode);
  }

  @override
  List<Object> get props => [
        uiLocale,
        uiThemeMode,
      ];
}

class MainboardInitial extends MainboardState {}

/*class MainboardStateUILocaleChanged extends MainboardState {
  const MainboardStateUILocaleChanged(Locale uiLocale)
      : super(uiLocale: uiLocale);
}

class MainboardStateUIThemeModeChanged extends MainboardState {
  const MainboardStateUIThemeModeChanged(ThemeMode uiThemeMode)
      : super(uiThemeMode: uiThemeMode);
}
*/
