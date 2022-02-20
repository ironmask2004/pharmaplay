part of 'dashboard_bloc.dart';

@immutable
class DashBoardState extends Equatable {
  const DashBoardState(
      {this.uiLocale = const Locale('en'),
      this.uiThemeMode = ThemeMode.system,
      this.scaffoldKey = const GlobalKey<ScaffoldState>()});

  final Locale uiLocale;
  final ThemeMode uiThemeMode;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  DashBoardState copyWith({
    Locale? uiLocale,
    ThemeMode? uiThemeMode,
  }) {
    return DashBoardState(
        uiLocale: uiLocale ?? this.uiLocale,
        uiThemeMode: uiThemeMode ?? this.uiThemeMode);
  }

  @override
  List<Object> get props => [
        uiLocale,
        uiThemeMode,
      ];
}

class DashBoardInitial extends DashBoardState {}

/*class DashBoardStateUILocaleChanged extends DashBoardState {
  const DashBoardStateUILocaleChanged(Locale uiLocale)
      : super(uiLocale: uiLocale);
}

class DashBoardStateUIThemeModeChanged extends DashBoardState {
  const DashBoardStateUIThemeModeChanged(ThemeMode uiThemeMode)
      : super(uiThemeMode: uiThemeMode);
}
*/
