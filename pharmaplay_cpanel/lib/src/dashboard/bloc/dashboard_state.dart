part of 'dashboard_bloc.dart';

@immutable
class DashBoardState extends Equatable {
  const DashBoardState(
      {this.status = 'Initial',
      this.localeUI = const Locale('en'),
      this.uiThemeMode = ThemeMode.system,
      this.primaryColor = const Color(0xFF2697FF),
      this.secondaryColor = const Color(0xFF2A2D3E),
      this.bgColor = const Color(0xFF212332),
      this.fontbodyColor = const Color(0xFF3390EC),
      this.headerSerachField = '',
      this.headSearchFilterApplied = false,
      this.drugRecord});

  //static final GlobalKey<ScaffoldState> scaffoldKey =       GlobalKey<ScaffoldState>();

  //final GlobalKey<ScaffoldState> scaffoldKey;
  final Locale localeUI;
  final String headerSerachField;
  final ThemeMode uiThemeMode;
  final Color primaryColor;
  final Color secondaryColor;
  final Color bgColor;
  final Color fontbodyColor;
  final String status;
  final bool headSearchFilterApplied;
  final DrugRecord? drugRecord;

  DashBoardState copyWith(
      {String? status,
      Locale? localeUI,
      ThemeMode? uiThemeMode,
      Color? primaryColor,
      Color? secondaryColor,
      Color? bgColor,
      Color? fontbodyColor,
      String? headerSerachField,
      bool? headSearchFilterApplied,
      DrugRecord? drugRecord}) {
    return DashBoardState(
      status: status ?? this.status,
      localeUI: localeUI ?? this.localeUI,
      uiThemeMode: uiThemeMode ?? this.uiThemeMode,
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      bgColor: bgColor ?? this.bgColor,
      fontbodyColor: fontbodyColor ?? this.fontbodyColor,
      headerSerachField: headerSerachField ?? this.headerSerachField,
      headSearchFilterApplied:
          headSearchFilterApplied ?? this.headSearchFilterApplied,
      drugRecord: drugRecord ?? this.drugRecord,
    );
  }

  @override
  List<Object> get props => [
        status,
        localeUI,
        uiThemeMode,
        primaryColor,
        secondaryColor,
        bgColor,
        fontbodyColor,
        headerSerachField,
        headSearchFilterApplied,
        drugRecord ?? DrugRecord.blank()
      ];
}

class DashBoardInitial extends DashBoardState {
  const DashBoardInitial() : super();
}

/*
class DashBoardStatelocaleUIChanged extends DashBoardState {
  const DashBoardStatelocaleUIChanged(Locale localeUI)
      : super(localeUI: localeUI);
}

class DashBoardStateUIThemeModeChanged extends DashBoardState {
  const DashBoardStateUIThemeModeChanged(ThemeMode uiThemeMode)
      : super(uiThemeMode: uiThemeMode);
}


class DashBoardDrugRecordCalled extends DashBoardState {
  final DrugRecord currentDrugRecord ;

  const DashBoardDrugRecordCalled(this.currentDrugRecord);

  @override
  List<Object> get props => [currentDrugRecord];
}
*/