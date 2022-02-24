import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'druggroup_event.dart';
part 'druggroup_state.dart';

class DrugGroupBloc extends Bloc<DrugGroupEvent, DrugGroupState> {
  DrugGroupBloc() : super(DrugGroupInitial()) {
    on<DrugGroupEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
