part of 'druggroup_bloc.dart';

abstract class DrugGroupEvent extends Equatable {
  const DrugGroupEvent();

  @override
  List<Object> get props => [];
}

class DrugGroupLocalUIChanged extends DrugGroupEvent {
  const DrugGroupLocalUIChanged(this.localUI);

  final String localUI;

  @override
  List<Object> get props => [localUI];
}

class DrugGroupsScrolledd extends DrugGroupEvent {
  const DrugGroupsScrolledd();
}

class DrugGroupsSearched extends DrugGroupEvent {
  final DrugGroupStatus? druggroupStatus;
  final String? localUI;
  final String? whereCond;
  final int? startFrompage;
  final int? pageLength;
  final String? orderByFields;
  final SearchType? searchType;
  final String? serachValue;
  const DrugGroupsSearched({
    this.druggroupStatus = DrugGroupStatus.initializing,
    this.localUI = 'en',
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
        localUI!,
        whereCond!,
        startFrompage!,
        pageLength!,
        orderByFields!,
        searchType!,
        serachValue!
      ];
}
