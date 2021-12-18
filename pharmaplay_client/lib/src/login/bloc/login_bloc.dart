import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:pharmaplay_client/src/login/login.dart';
import 'package:dartz/dartz.dart' as dartz;

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const LoginState()) {
    on<SignUpFirstNameChanged>(_onSignUpFirstNameChanged);
    on<SignUpLastNameChanged>(_onSignUpLastNameChanged);
    on<SignUpMobileChanged>(_onSignUpMobileChanged);
    on<SignUpEmailChanged>(_onSignUpEmailChanged);
    on<SignUpPasswordChanged>(_onSignUpPasswordChanged);
    on<SignUpConfirmPasswordChanged>(_onSignUpConfirmPasswordChanged);
    on<SignUpSubmitted>(_onSignUpSubmitted);
    on<LoginEmailChanged>(_onLoginEmailChanged);
    on<LoginPasswordChanged>(_onLoginPasswordChanged);
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  final AuthenticationRepository _authenticationRepository;

  void _onSignUpFirstNameChanged(
    SignUpFirstNameChanged event,
    Emitter<LoginState> emit,
  ) {
    print('_onSignUpFirstNameChanged');
    final firstName = InputString.dirty(event.firstName);
    emit(state.copyWith(
      firstName: firstName,
      status: Formz.validate([
        state.firstName,
        state.lastName,
        state.mobile,
        state.email,
        state.password,
        state.confirmPassword
      ]),
    ));
  }

  void _onSignUpLastNameChanged(
    SignUpLastNameChanged event,
    Emitter<LoginState> emit,
  ) {
    print('_onSignUpLastNameChanged');
    final lastName = InputString.dirty(event.lastName);
    emit(state.copyWith(
      lastName: lastName,
      status: Formz.validate([
        state.firstName,
        state.lastName,
        state.mobile,
        state.email,
        state.password,
        state.confirmPassword
      ]),
    ));
  }

  void _onSignUpMobileChanged(
    SignUpMobileChanged event,
    Emitter<LoginState> emit,
  ) {
    print('_onSignUpMobileChanged');
    final mobile = Mobile.dirty(event.mobile);
    emit(state.copyWith(
      mobile: mobile,
      status: Formz.validate([
        state.firstName,
        state.lastName,
        state.mobile,
        state.email,
        state.password,
        state.confirmPassword
      ]),
    ));
  }

  void _onSignUpConfirmPasswordChanged(
    SignUpConfirmPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    print('_onSignUpConfirmPasswordChanged');
    final confirmPassword = Password.dirty(event.confirmPassword);
    emit(state.copyWith(
      confirmPassword: confirmPassword,
      status: Formz.validate([
        state.firstName,
        state.lastName,
        state.mobile,
        state.email,
        state.password,
        state.confirmPassword
      ]),
    ));
  }

  void _onLoginEmailChanged(
    LoginEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    print('_onEmailChanged');
    final email = Email.dirty(event.email);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([state.password, email]),
    ));
  }

  void _onLoginPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    print('_onpasswordChanged');
    final password = Password.dirty(event.password);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([password, state.email]),
    ));
  }

  void _onSignUpEmailChanged(
    SignUpEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    print('_onSignUpEmailChanged');
    final email = Email.dirty(event.email);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([
        state.firstName,
        state.lastName,
        state.mobile,
        state.email,
        state.password,
        state.confirmPassword
      ]),
    ));
  }

  void _onSignUpPasswordChanged(
    SignUpPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    print('_onSignUpPasswordChanged');
    final password = Password.dirty(event.password);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([
        state.firstName,
        state.lastName,
        state.mobile,
        state.email,
        state.password,
        state.confirmPassword
      ]),
    ));
  }

  void _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
//-----------------
      final dartz.Either<TokenPair, ApiError> _repoResponse;
      try {
        //TokenPair _tokenInfo;
        _repoResponse = await _authenticationRepository.logIn(
            email: state.email.value, password: state.password.value);

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

  //========================

  void _onSignUpSubmitted(
    SignUpSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
//-----------------
      final dartz.Either<TokenPair, ApiError> _repoResponse;
      print('_SignUpSubmitted');
      print(state.toString());
      emit(state.copyWith(
          status: FormzStatus.submissionFailure, errMsg: 'submissionFailure'));

      /* try {
        //TokenPair _tokenInfo;
        _repoResponse = await _authenticationRepository.signUp(
            email: state.email.value, password: state.password.value);

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
      }*/
    }
  }
}
