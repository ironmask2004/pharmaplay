import 'package:formz/formz.dart';

enum InputStringValidationError { empty }

class InputString extends FormzInput<String, InputStringValidationError> {
  const InputString.pure() : super.pure('');
  const InputString.dirty([String value = '']) : super.dirty(value);

  @override
  InputStringValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : InputStringValidationError.empty;
  }
}
