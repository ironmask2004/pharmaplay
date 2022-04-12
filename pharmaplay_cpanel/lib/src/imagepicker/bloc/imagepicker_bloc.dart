import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'imagepicker_event.dart';
part 'imagepicker_state.dart';

class ImagePickerBloc extends Bloc<ImagepickerEvent, ImagepickerState> {
  ImagePickerBloc() : super(ImagepickerInitial()) {
    on<ImagepickerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
