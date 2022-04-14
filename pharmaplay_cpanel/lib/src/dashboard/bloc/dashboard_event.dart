part of 'dashboard_bloc.dart';

@immutable
abstract class DashBoardEvent extends Equatable {
  const DashBoardEvent();

  @override
  List<Object> get props => [];
}

class UILocalChanged extends DashBoardEvent {
  const UILocalChanged(this.localeUI);

  final Locale localeUI;

  @override
  List<Object> get props => [localeUI];
}

class UIThemeModeChanged extends DashBoardEvent {
  const UIThemeModeChanged(this.uiThemeMode);

  final ThemeMode uiThemeMode;

  @override
  List<Object> get props => [uiThemeMode];
}

class DashBoardInitialRequested extends DashBoardEvent {}

class NotifyState extends DashBoardEvent {}

class ReloadlocaleUIRequsted extends DashBoardEvent {}

class ReloadUIThemeModeRequsted extends DashBoardEvent {}

class InitSubBlocs extends DashBoardEvent {}

class SideMenuClicked extends DashBoardEvent {
  final BuildContext context;

  const SideMenuClicked(this.context);

  @override
  List<Object> get props => [context];
}

class DrugRecordCardCalled extends DashBoardEvent {
  //final BuildContext context;
  final DrugRecord drugRecord;

  const DrugRecordCardCalled(this.drugRecord);

  @override
  List<Object> get props => [drugRecord];
}

class DrugRecordCardCalledBack extends DashBoardEvent {
  //final BuildContext context;
  final DrugRecord drugRecord;

  const DrugRecordCardCalledBack(this.drugRecord);

  @override
  List<Object> get props => [drugRecord];
}

class RightMenuClicked extends DashBoardEvent {
  final BuildContext context; //= GlobalKey<ScaffoldState>();

  const RightMenuClicked(this.context);

  @override
  List<Object> get props => [context];
}

class SettingsInitialRequested extends DashBoardEvent {}

class HeaderSerachFieldChanged extends DashBoardEvent {
  const HeaderSerachFieldChanged(this.headerSerachField);

  final String headerSerachField;

  @override
  List<Object> get props => [headerSerachField];
}

class HeaderSerachSubmitted extends DashBoardEvent {
  const HeaderSerachSubmitted();
}
