part of 'dashboard_bloc.dart';

@immutable
abstract class DashBoardEvent extends Equatable {
  const DashBoardEvent();

  @override
  List<Object> get props => [];
}

class UILocalChanged extends DashBoardEvent {
  const UILocalChanged(this.uiLocale);

  final Locale uiLocale;

  @override
  List<Object> get props => [uiLocale];
}

class UIThemeModeChanged extends DashBoardEvent {
  const UIThemeModeChanged(this.uiThemeMode);

  final ThemeMode uiThemeMode;

  @override
  List<Object> get props => [uiThemeMode];
}

class DashBoardInitialRequested extends DashBoardEvent {}

class ReloadUILocaleRequsted extends DashBoardEvent {}

class ReloadUIThemeModeRequsted extends DashBoardEvent {}

class SideMenuClicked extends DashBoardEvent {
  final BuildContext context;

  const SideMenuClicked(this.context);

  @override
  List<Object> get props => [context];
}

class RightMenuClicked extends DashBoardEvent {
  final BuildContext context; //= GlobalKey<ScaffoldState>();

  const RightMenuClicked(this.context);

  @override
  List<Object> get props => [context];
}

class SettingsInitialRequested extends DashBoardEvent {}
