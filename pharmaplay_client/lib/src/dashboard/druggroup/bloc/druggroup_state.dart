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
      this.druggroups = const [],
      this.stateMsg = '',
      this.localUI = 'en',
      this.hasReachedMax = false,
      this.startFrompage = 1,
      this.pageLength = 16,
      this.currentPage = 1,
      this.whereCond = '',
      this.searchType = SearchType.none,
      this.serachValue = '',
      this.orderByFields = ''});

  final DrugGroupStatus status;
  final String localUI;
  final String whereCond;
  final bool hasReachedMax;
  final List<DrugGroup> druggroups;
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
        druggroups,
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
      List<DrugGroup>? druggroups,
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
        druggroups: druggroups ?? this.druggroups,
        stateMsg: stateMsg ?? this.stateMsg,
        startFrompage: startFrompage ?? this.startFrompage,
        currentPage: currentPage ?? this.currentPage,
        pageLength: pageLength ?? this.pageLength,
        searchType: searchType ?? this.searchType,
        serachValue: serachValue ?? this.serachValue,
        orderByFields: orderByFields ?? this.orderByFields);
  }
}
