part of 'druggroup_bloc.dart';

enum DrugGroupStatus { initializing, loading, success, failed, empty }

class DrugGroupState extends Equatable {
  const DrugGroupState(
      {this.status = DrugGroupStatus.empty,
      this.drugGroups = const [],
      this.errMsg = '',
      this.localUI = 'en',
      this.whereCond = ' '});

  final DrugGroupStatus status;
  final String localUI;
  final String whereCond;

  final List<DrugGroup> drugGroups;
  final String errMsg;

  DrugGroupState copyWith(
      {DrugGroupStatus? status,
      List<DrugGroup>? drugGroups,
      String? errMsg,
      String? localUI,
      String? whereCond}) {
    return DrugGroupState(
      status: status ?? this.status,
      localUI: localUI ?? this.localUI,
      drugGroups: drugGroups ?? this.drugGroups,
      whereCond: whereCond ?? this.whereCond,
      errMsg: errMsg ?? this.errMsg,
    );
  }

  @override
  List<Object> get props => [status, drugGroups, localUI, whereCond, errMsg];
}
