part of 'drug_bloc.dart';

abstract class DrugEvent extends Equatable {
  const DrugEvent();

  @override
  List<Object> get props => [];
}

class DrugLocalUIChanged extends DrugEvent {
  const DrugLocalUIChanged(this.localUI);

  final String localUI;

  @override
  List<Object> get props => [localUI];
}

class DrugGetAll extends DrugEvent {
  const DrugGetAll();
}

class DrugsFetched extends DrugEvent {
  final DrugStatus? drugStatus;
  final String? localUI;
  final String? whereCond;
  final int? startFrompage;
  final int? pageLength;
  final String? orderByFields;
  final SearchType? searchType;
  final String? serachValue;
  const DrugsFetched({
    this.drugStatus = DrugStatus.initializing,
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
        drugStatus!,
        localUI!,
        whereCond!,
        startFrompage!,
        pageLength!,
        orderByFields!,
        searchType!,
        serachValue!
      ];
}
