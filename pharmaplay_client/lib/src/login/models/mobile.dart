import 'package:formz/formz.dart';

enum MobileValidationError { empty }

class Mobile extends FormzInput<String, MobileValidationError> {
  const Mobile.pure() : super.pure('');
  const Mobile.dirty([String value = '']) : super.dirty(value);

  @override
  MobileValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : MobileValidationError.empty;
  }
}
