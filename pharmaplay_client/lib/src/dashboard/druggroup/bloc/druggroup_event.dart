part of 'druggroup_bloc.dart';

abstract class DrugGroupEvent extends Equatable {
  const DrugGroupEvent();

  @override
  List<Object> get props => [];
}

class DrugGrouplocaleUIChanged extends DrugGroupEvent {
  const DrugGrouplocaleUIChanged(this.localeUI);

  final String localeUI;

  @override
  List<Object> get props => [localeUI];
}

class DrugGroupsScrolledd extends DrugGroupEvent {
  const DrugGroupsScrolledd();
}

class DrugGroupsSearched extends DrugGroupEvent {
  final DrugGroupStatus? druggroupStatus;
  final String? localeUI;
  final String? whereCond;
  final int? startFrompage;
  final int? pageLength;
  final String? orderByFields;
  final SearchType? searchType;
  final String? serachValue;
  const DrugGroupsSearched({
    this.druggroupStatus = DrugGroupStatus.initializing,
    this.localeUI = 'en',
    this.whereCond = '',
    this.startFrompage = 1,
    this.pageLength = 10,
    this.orderByFields = '',
    this.searchType = SearchType.none,
    this.serachValue = '',
  });

  @override
  List<Object> get props => [
        druggroupStatus!,
        localeUI!,
        whereCond!,
        startFrompage!,
        pageLength!,
        orderByFields!,
        searchType!,
        serachValue!
      ];
}
