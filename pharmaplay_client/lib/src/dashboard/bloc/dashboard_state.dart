part of 'dashboard_bloc.dart';

@immutable
class DashBoardState extends Equatable {
  const DashBoardState(
      {this.uiLocale = const Locale('en'),
      this.uiThemeMode = ThemeMode.system,
      this.primaryColor = const Color(0xFF2697FF),
      this.secondaryColor = const Color(0xFF2A2D3E),
      this.bgColor = const Color(0xFF212332),
      this.fontbodyColor = const Color(0xFF3390EC),
      this.headerSerachField = ''});

  //static final GlobalKey<ScaffoldState> scaffoldKey =       GlobalKey<ScaffoldState>();

  //final GlobalKey<ScaffoldState> scaffoldKey;
  final Locale uiLocale;
  final String headerSerachField;
  final ThemeMode uiThemeMode;
  final Color primaryColor;
  final Color secondaryColor;
  final Color bgColor;
  final Color fontbodyColor;

  /*
   primaryColor = Color(0xFF2697FF);
   secondaryColor = Color(0xFF2A2D3E);
   bgColor = Color(0xFF212332);
   fontbodyColor = Color.fromARGB(255, 51, 144, 236);

 primaryColor = Color.fromARGB(255, 41, 73, 102);
 secondaryColor = Color.fromARGB(255, 205, 200, 255);
 bgColor = Color.fromARGB(255, 205, 225, 255);
 fontbodyColor = Color.fromARGB(255, 2, 13, 24);

*/

  DashBoardState copyWith(
      {Locale? uiLocale,
      ThemeMode? uiThemeMode,
      Color? primaryColor,
      Color? secondaryColor,
      Color? bgColor,
      Color? fontbodyColor,
      String? headerSerachField}) {
    return DashBoardState(
        uiLocale: uiLocale ?? this.uiLocale,
        uiThemeMode: uiThemeMode ?? this.uiThemeMode,
        primaryColor: primaryColor ?? this.primaryColor,
        secondaryColor: secondaryColor ?? this.secondaryColor,
        bgColor: bgColor ?? this.bgColor,
        fontbodyColor: fontbodyColor ?? this.fontbodyColor,
        headerSerachField: headerSerachField ?? this.headerSerachField);
  }

  @override
  List<Object> get props => [
        uiLocale,
        uiThemeMode,
        primaryColor,
        secondaryColor,
        bgColor,
        fontbodyColor,
        headerSerachField
      ];
}

class DashBoardInitial extends DashBoardState {
  const DashBoardInitial() : super();
}

/*
class DashBoardStateuiLocaleChanged extends DashBoardState {
  const DashBoardStateuiLocaleChanged(Locale uiLocale)
      : super(uiLocale: uiLocale);
}

class DashBoardStateUIThemeModeChanged extends DashBoardState {
  const DashBoardStateUIThemeModeChanged(ThemeMode uiThemeMode)
      : super(uiThemeMode: uiThemeMode);
}
*/
