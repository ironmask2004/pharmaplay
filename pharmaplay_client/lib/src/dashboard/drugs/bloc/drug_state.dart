part of 'drug_bloc.dart';

enum DrugStatus { initializing, loading, success, failed, empty }

class DrugState extends Equatable {
  const DrugState(
      {this.status = DrugStatus.empty,
      this.drugs = const [],
      this.errMsg = '',
      this.localUI = 'en',
      this.whereCond = ' '});

  final DrugStatus status;
  final String localUI;
  final String whereCond;

  final List<DrugRecord> drugs;
  final String errMsg;

  DrugState copyWith(
      {DrugStatus? status,
      List<DrugRecord>? drugs,
      String? errMsg,
      String? localUI,
      String? whereCond}) {
    return DrugState(
      status: status ?? this.status,
      localUI: localUI ?? this.localUI,
      drugs: drugs ?? this.drugs,
      whereCond: whereCond ?? this.whereCond,
      errMsg: errMsg ?? this.errMsg,
    );
  }

  @override
  List<Object> get props => [status, drugs, localUI, whereCond, errMsg];
}
