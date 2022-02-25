part of 'druggroup_bloc.dart';

abstract class DrugGroupEvent extends Equatable {
  const DrugGroupEvent();

  @override
  List<Object> get props => [];
}

class LocalUIChanged extends DrugGroupEvent {
  const LocalUIChanged(this.localUI);

  final String localUI;

  @override
  List<Object> get props => [localUI];
}

class DrugGroupGetAll extends DrugGroupEvent {
  const DrugGroupGetAll();
}

class DrugGroupGetSearch extends DrugGroupEvent {
  const DrugGroupGetSearch(this.whereCond);

  final String whereCond;

  @override
  List<Object> get props => [whereCond];
}
