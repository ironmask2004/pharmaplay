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
    on<LoginFirstNameChanged>(_onLoginFirstNameChanged);
    on<LoginLastNameChanged>(_onLoginLastNameChanged);
    on<LoginMobileChanged>(_onLoginMobileChanged);
    on<LoginConfirmPasswordChanged>(_onLoginConfirmPasswordChanged);

    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
    on<SignUpSubmitted>(_SignUpSubmitted);
  }

  final AuthenticationRepository _authenticationRepository;

  void _onLoginFirstNameChanged(
    LoginFirstNameChanged event,
    Emitter<LoginState> emit,
  ) {
    print('_onLoginFirstNameChanged');
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

  void _onLoginLastNameChanged(
    LoginLastNameChanged event,
    Emitter<LoginState> emit,
  ) {
    print('_onLoginLastNameChanged');
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

  void _onLoginMobileChanged(
    LoginMobileChanged event,
    Emitter<LoginState> emit,
  ) {
    print('_onLoginMobileChanged');
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

  void _onLoginConfirmPasswordChanged(
    LoginConfirmPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    print('_onLoginConfirmPasswordChanged');
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

  void _onEmailChanged(
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

  void _onPasswordChanged(
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

  void _onSubmitted(
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

  void _SignUpSubmitted(
    SignUpSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
//-----------------
      final dartz.Either<TokenPair, ApiError> _repoResponse;
      print('_SignUpSubmitted');
      print(state.toString());
      emit(state.copyWith(status: FormzStatus.submissionSuccess, errMsg: ''));

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
