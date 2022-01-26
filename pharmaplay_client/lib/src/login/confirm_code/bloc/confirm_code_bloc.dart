import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
//import 'package:pharmaplay_client/src/login/login.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:pharmaplay_client/src/login/confirm_code/confirm_code.dart';

part 'confirm_code_event.dart';
part 'confirm_code_state.dart';

class ConfirmCodeBloc extends Bloc<ConfirmCodeEvent, ConfirmCodeState> {
  ConfirmCodeBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const ConfirmCodeState()) {
    on<ConfirmFormEmailChanged>(_onConfirmFormEmailChanged);
    on<ConfirmFormPasswordChanged>(_onConfirmFormPasswordChanged);
    on<ConfirmCodeChanged>(_onConfirmCodeChanged);
    on<ConfirmCodeSubmitted>(_onConfirmCodeSubmitted);
    on<ResendConfirmCodeSubmitted>(_onResendConfirmCodeSubmitted);
  }

  final AuthenticationRepository _authenticationRepository;

  void _onConfirmFormPasswordChanged(
    ConfirmFormPasswordChanged event,
    Emitter<ConfirmCodeState> emit,
  ) {
    print('_onConfirmFormPasswordChanged');
    final password = Password.dirty(event.password);
    print('${state.email}, ${state.password}   ${state.confirmCode} ');
    emit(state.copyWith(
      password: password,
      status: Formz.validate([state.email, state.password, state.confirmCode]),
    ));
  }

  void _onConfirmFormEmailChanged(
    ConfirmFormEmailChanged event,
    Emitter<ConfirmCodeState> emit,
  ) {
    print('_onConfirmFormEmailChanged');
    final email = Email.dirty(event.email);
    print('${state.email}, ${state.password}   ${state.confirmCode} ');
    emit(state.copyWith(
      email: email,
      status: Formz.validate([state.email, state.password, state.confirmCode]),
    ));
  }

  void _onConfirmCodeChanged(
    ConfirmCodeChanged event,
    Emitter<ConfirmCodeState> emit,
  ) {
    print('_onConfirmCodeChanged');
    final confirmCode = InputString.dirty(event.confirmCode);
    emit(state.copyWith(
      confirmCode: confirmCode,
      status: Formz.validate([state.email, state.password, state.confirmCode]),
    ));
  }

  //=======================
  //

  //-==========

  void _onResendConfirmCodeSubmitted(
    ResendConfirmCodeSubmitted event,
    Emitter<ConfirmCodeState> emit,
  ) async {
    print('Emailll: ' + event.email + ' password: ' + event.password);

    emit(state.copyWith(status: FormzStatus.submissionInProgress));
//-----------------
    final dartz.Either<TokenPair, ApiError> _repoResponse;
    try {
      //TokenPair _tokenInfo;
      _repoResponse = await _authenticationRepository.resendVerficationCode(
          email: event.email, password: event.password);

      _repoResponse.fold((left) {
        print('left');
        // return (left);
        print(left.toJson().toString());
        emit(state.copyWith(
            status: FormzStatus.submissionSuccess,
            errMsg: left.toJson().toString()));
      }, (right) {
        //showInSnackBar(context, ("Login Successs!!"));
        print('right');
        emit(state.copyWith(
            status: FormzStatus.submissionFailure,
            errMsg: right.toJson().toString()));

        //return (right);
      });
    } catch (err) {
      print('Error connectiing to server ' + err.toString());
      rethrow;
      // showInSnackBar(context, err.toString());
    }
  }
  //========================

  void _onConfirmCodeSubmitted(
    ConfirmCodeSubmitted event,
    Emitter<ConfirmCodeState> emit,
  ) async {
    print('formstate: ${state.status}');
    print(state.email.value +
        ' password: ' +
        state.password.value +
        ' confirmCode: ' +
        state.confirmCode.value);
    if (!state.status.isValidated) {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure,
          errMsg: 'Inpuut Data Error!!'));
      return;
    }
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
//-----------------
    final dartz.Either<TokenPair, ApiError> _repoResponse;
    try {
      //TokenPair _tokenInfo;
      _repoResponse = await _authenticationRepository.logInUserWithVerfication(
          email: state.email.value,
          password: state.password.value,
          confirmCode: state.confirmCode.value);

      _repoResponse.fold((left) {
        print('left');
        // return (left);
        print(left.toJson().toString());
        emit(state.copyWith(
            status: FormzStatus.submissionSuccess,
            errMsg: left.toJson().toString()));
      }, (right) {
        //showInSnackBar(context, ("Login Successs!!"));
        print('right');
        emit(state.copyWith(
            status: FormzStatus.submissionFailure,
            errMsg: right.toJson().toString()));

        //return (right);
      });
    } catch (err) {
      print('Error connectiing to server ' + err.toString());
      rethrow;
      // showInSnackBar(context, err.toString());
    }
  }
}
