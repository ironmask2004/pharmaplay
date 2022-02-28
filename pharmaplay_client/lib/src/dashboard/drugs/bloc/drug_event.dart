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

class DrugGetSearch extends DrugEvent {
  const DrugGetSearch(this.whereCond);

  final String whereCond;

  @override
  List<Object> get props => [whereCond];
}

class DrugFetched extends DrugEvent {}
