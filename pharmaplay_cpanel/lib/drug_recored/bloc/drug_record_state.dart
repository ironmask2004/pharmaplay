part of 'drug_record_bloc.dart';

enum DrugRecordStatus {
  initializing,
  loading,
  success,
  failed,
  empty,
  scrollLoading,
  isSubmissionFailure,
  isSubmissionSuccess,
  isSubmissionInProgress
}

class DrugRecordState extends Equatable {
  const DrugRecordState(
      {this.status = DrugRecordStatus.empty,
      this.drugRecords = const [],
      this.stateMsg = '',
      this.localeUI = 'en',
      this.hasReachedMax = false,
      this.startFrompage = 1,
      this.pageLength = 16,
      this.currentPage = 1,
      this.whereCond = '',
      this.searchType = SearchType.none,
      this.serachValue = '',
      this.orderByFields = '',
      this.errMsg = ''});

  final DrugRecordStatus status;
  final String localeUI;
  final String whereCond;
  final bool hasReachedMax;
  final List<DrugRecord> drugRecords;
  final String stateMsg;
  final int startFrompage;
  final int currentPage;
  final int pageLength;
  final String orderByFields;
  final SearchType searchType;
  final String serachValue;
  final String errMsg;

  @override
  List<Object> get props => [
        status,
        drugRecords,
        localeUI,
        whereCond,
        hasReachedMax,
        startFrompage,
        currentPage,
        pageLength,
        stateMsg,
        searchType,
        serachValue,
        orderByFields,
        errMsg
      ];

  DrugRecordState copyWith(
      {DrugRecordStatus? status,
      String? localeUI,
      String? whereCond,
      bool? hasReachedMax,
      List<DrugRecord>? drugRecords,
      String? stateMsg,
      int? startFrompage,
      int? currentPage,
      int? pageLength,
      SearchType? searchType,
      String? serachValue,
      String? orderByFields,
      String? errMsg}) {
    return DrugRecordState(
        status: status ?? this.status,
        localeUI: localeUI ?? this.localeUI,
        whereCond: whereCond ?? this.whereCond,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        drugRecords: drugRecords ?? this.drugRecords,
        stateMsg: stateMsg ?? this.stateMsg,
        startFrompage: startFrompage ?? this.startFrompage,
        currentPage: currentPage ?? this.currentPage,
        pageLength: pageLength ?? this.pageLength,
        searchType: searchType ?? this.searchType,
        serachValue: serachValue ?? this.serachValue,
        orderByFields: orderByFields ?? this.orderByFields,
        errMsg: errMsg ?? this.errMsg);
  }
}
