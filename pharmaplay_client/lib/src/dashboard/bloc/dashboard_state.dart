part of 'dashboard_bloc.dart';

@immutable
class DashBoardState extends Equatable {
  const DashBoardState(
      {this.uiLocale = const Locale('en'),
      this.uiThemeMode = ThemeMode.system,
      required this.scaffoldKey});

  //static final GlobalKey<ScaffoldState> scaffoldKey =       GlobalKey<ScaffoldState>();

  final GlobalKey<ScaffoldState> scaffoldKey;
  final Locale uiLocale;
  final ThemeMode uiThemeMode;

  DashBoardState copyWith({
    Locale? uiLocale,
    ThemeMode? uiThemeMode,
  }) {
    return DashBoardState(
        uiLocale: uiLocale ?? this.uiLocale,
        uiThemeMode: uiThemeMode ?? this.uiThemeMode,
        scaffoldKey: scaffoldKey);
  }

  @override
  List<Object> get props => [uiLocale, scaffoldKey];
}

class DashBoardInitial extends DashBoardState {
  const DashBoardInitial({required GlobalKey<ScaffoldState> scaffoldKey})
      : super(scaffoldKey: scaffoldKey);
}

/*class DashBoardStateuiLocaleChanged extends DashBoardState {
  const DashBoardStateuiLocaleChanged(Locale uiLocale)
      : super(uiLocale: uiLocale);
}

class DashBoardStateUIThemeModeChanged extends DashBoardState {
  const DashBoardStateUIThemeModeChanged(ThemeMode uiThemeMode)
      : super(uiThemeMode: uiThemeMode);
}
*/
