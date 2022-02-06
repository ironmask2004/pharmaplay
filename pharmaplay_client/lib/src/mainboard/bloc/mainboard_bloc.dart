import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'mainboard_event.dart';
part 'mainboard_state.dart';

class MainboardBloc extends Bloc<MainboardEvent, MainboardState> {
  MainboardBloc() : super(MainboardInitial()) {
    on<MainboardEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
