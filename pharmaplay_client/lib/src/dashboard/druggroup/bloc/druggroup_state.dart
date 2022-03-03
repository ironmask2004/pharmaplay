part of 'druggroup_bloc.dart';

enum DrugGroupStatus {
  initializing,
  loading,
  success,
  failed,
  empty,
  scrolloading
}

class DrugGroupState extends Equatable {
  const DrugGroupState(
      {this.status = DrugGroupStatus.empty,
      this.drugGroups = const [],
      this.stateMsg = '',
      this.localUI = 'en',
      this.hasReachedMax = false,
      this.startFrompage = 1,
      this.pageLength = 8,
      this.currentPage = 1,
      this.whereCond = '',
      this.searchType = SearchType.none,
      this.serachValue = '',
      this.orderByFields = ''});

  final DrugGroupStatus status;
  final String localUI;
  final String whereCond;
  final bool hasReachedMax;
  final List<DrugGroup> drugGroups;
  final String stateMsg;
  final int startFrompage;
  final int currentPage;
  final int pageLength;
  final String orderByFields;
  final SearchType searchType;
  final String serachValue;

  @override
  List<Object> get props => [
        status,
        drugGroups,
        localUI,
        whereCond,
        hasReachedMax,
        startFrompage,
        currentPage,
        pageLength,
        stateMsg,
        searchType,
        serachValue,
        orderByFields
      ];

  DrugGroupState copyWith(
      {DrugGroupStatus? status,
      String? localUI,
      String? whereCond,
      bool? hasReachedMax,
      List<DrugGroup>? drugGroups,
      String? stateMsg,
      int? startFrompage,
      int? currentPage,
      int? pageLength,
      SearchType? searchType,
      String? serachValue,
      String? orderByFields}) {
    return DrugGroupState(
        status: status ?? this.status,
        localUI: localUI ?? this.localUI,
        whereCond: whereCond ?? this.whereCond,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        drugGroups: drugGroups ?? this.drugGroups,
        stateMsg: stateMsg ?? this.stateMsg,
        startFrompage: startFrompage ?? this.startFrompage,
        currentPage: currentPage ?? this.currentPage,
        pageLength: pageLength ?? this.pageLength,
        searchType: searchType ?? this.searchType,
        serachValue: serachValue ?? this.serachValue,
        orderByFields: orderByFields ?? this.orderByFields);
  }
}
