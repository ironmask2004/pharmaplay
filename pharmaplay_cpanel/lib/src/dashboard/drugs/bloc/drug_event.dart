part of 'drug_bloc.dart';

abstract class DrugEvent extends Equatable {
  const DrugEvent();

  @override
  List<Object> get props => [];
}

class DruglocaleUIChanged extends DrugEvent {
  const DruglocaleUIChanged(this.localeUI);

  final String localeUI;

  @override
  List<Object> get props => [localeUI];
}

class DrugsScrolledd extends DrugEvent {
  const DrugsScrolledd();
}

class DrugsSearched extends DrugEvent {
  final DrugStatus? drugStatus;
  final String? localeUI;
  final String? whereCond;
  final int? startFrompage;
  final int? pageLength;
  final String? orderByFields;
  final SearchType? searchType;
  final String? serachValue;
  const DrugsSearched({
    this.drugStatus = DrugStatus.initializing,
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
        drugStatus!,
        localeUI!,
        whereCond!,
        startFrompage!,
        pageLength!,
        orderByFields!,
        searchType!,
        serachValue!
      ];
}
