part of 'drug_bloc.dart';

enum DrugStatus { initializing, loading, success, failed, empty }

class DrugState extends Equatable {
  const DrugState(
      {this.status = DrugStatus.empty,
      this.drugs = const [],
      this.stateMsg = '',
      this.localUI = 'en',
      this.hasReachedMax = false,
      this.startFrompage = 1,
      this.pageLength = 10,
      this.currentPage = 1,
      this.whereCond = ' '});

  final DrugStatus status;
  final String localUI;
  final String whereCond;
  final bool hasReachedMax;
  final List<DrugRecord> drugs;
  final String stateMsg;
  final int startFrompage;
  final int currentPage;
  final int pageLength;

  @override
  List<Object> get props => [
        status,
        drugs,
        localUI,
        whereCond,
        hasReachedMax,
        startFrompage,
        currentPage,
        pageLength,
        stateMsg
      ];

  DrugState copyWith({
    DrugStatus? status,
    String? localUI,
    String? whereCond,
    bool? hasReachedMax,
    List<DrugRecord>? drugs,
    String? stateMsg,
    int? startFrompage,
    int? currentPage,
    int? pageLength,
  }) {
    return DrugState(
      status: status ?? this.status,
      localUI: localUI ?? this.localUI,
      whereCond: whereCond ?? this.whereCond,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      drugs: drugs ?? this.drugs,
      stateMsg: stateMsg ?? this.stateMsg,
      startFrompage: startFrompage ?? this.startFrompage,
      currentPage: currentPage ?? this.currentPage,
      pageLength: pageLength ?? this.pageLength,
    );
  }
}
