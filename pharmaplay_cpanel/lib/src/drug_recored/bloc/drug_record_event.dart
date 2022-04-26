part of 'drug_record_bloc.dart';

abstract class DrugRecordEvent extends Equatable {
  const DrugRecordEvent();

  @override
  List<Object> get props => [];
}

class DruglocaleUIChanged extends DrugRecordEvent {
  const DruglocaleUIChanged(this.localeUI);

  final String localeUI;

  @override
  List<Object> get props => [localeUI];
}

class DrugImageCardDoublePressed extends DrugRecordEvent {
  const DrugImageCardDoublePressed(this.drugID);

  final int drugID;

  @override
  List<Object> get props => [drugID];
}

class DrugRecordScrolledd extends DrugRecordEvent {
  const DrugRecordScrolledd();
}

class DrugRecordSearched extends DrugRecordEvent {
  final DrugRecordStatus? drugRecordStatus;
  final String? localeUI;
  final String? whereCond;
  final int? startFrompage;
  final int? pageLength;
  final String? orderByFields;
  final SearchType? searchType;
  final String? serachValue;
  const DrugRecordSearched({
    this.drugRecordStatus = DrugRecordStatus.initializing,
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
        drugRecordStatus!,
        localeUI!,
        whereCond!,
        startFrompage!,
        pageLength!,
        orderByFields!,
        searchType!,
        serachValue!
      ];
}
