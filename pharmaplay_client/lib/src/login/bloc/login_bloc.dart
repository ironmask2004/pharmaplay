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
    on<SignUpFirstnameChanged>(_onSignUpFirstnameChanged);
    on<SignUpLastnameChanged>(_onSignUpLastnameChanged);
    on<SignUpMobileChanged>(_onSignUpMobileChanged);
    on<SignUpEmailChanged>(_onSignUpEmailChanged);
    on<SignUpPasswordChanged>(_onSignUpPasswordChanged);
    on<SignUpConfirmPasswordChanged>(_onSignUpConfirmPasswordChanged);
    on<SignUpSubmitted>(_onSignUpSubmited);
    on<LoginEmailChanged>(_onLoginEmailChanged);
    on<ForgotEmailChanged>(_onforgotEmailChanged);

    on<LoginPasswordChanged>(_onLoginPasswordChanged);

    on<ConfirmFormEmailChanged>(_onConfirmFormEmailChanged);
    on<ConfirmFormPasswordChanged>(_onConfirmFormPasswordChanged);

    on<ConfirmCodeChanged>(_onConfirmCodeChanged);
    on<LoginSubmitted>(_onLoginSubmitted);
    on<ConfirmCodeSubmitted>(_onConfirmCodeSubmitted);
    on<ResendConfirmCodeSubmitted>(_onResendConfirmCodeSubmitted);
    on<ForgotPasswordSubmitted>(_onForgotPasswordSubmitted);

    // on<RoutToSignUpPageSubmitted>(_onRoutToSignUpPageSubmitted);
  }

  final AuthenticationRepository _authenticationRepository;

  void _onSignUpFirstnameChanged(
    SignUpFirstnameChanged event,
    Emitter<LoginState> emit,
  ) {
    print('_onSignUpFirstnameChanged');
    final firstname = InputString.dirty(event.firstname);
    emit(state.copyWith(
      firstname: firstname,
      status: Formz.validate([
        state.firstname,
        state.lastname,
        state.mobile,
        state.email,
        state.password,
        state.confirmPassword
      ]),
    ));
  }

  void _onSignUpLastnameChanged(
    SignUpLastnameChanged event,
    Emitter<LoginState> emit,
  ) {
    //print(SLang.of(context).onsignuplastnamechanged);
    final lastname = InputString.dirty(event.lastname);
    emit(state.copyWith(
      lastname: lastname,
      status: Formz.validate([
        state.firstname,
        state.lastname,
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
        state.firstname,
        state.lastname,
        state.mobile,
        state.email,
        state.password,
        state.confirmPassword
      ]),
    ));
  }

  void _onConfirmCodeChanged(
    ConfirmCodeChanged event,
    Emitter<LoginState> emit,
  ) {
    print('_onConfirmCodeChanged');
    final confirmCode = InputString.dirty(event.confirmCode);
    print('${state.email}, ${state.password}   ${state.confirmCode} ');
    emit(state.copyWith(
      confirmCode: confirmCode,
      status: Formz.validate([state.email, state.password, state.confirmCode]),
    ));
  }

  void _onforgotEmailChanged(
    ForgotEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    print('_onforgotEmailChanged');
    final email = Email.dirty(event.email);
    print('${state.email},   ');
    emit(state.copyWith(
      email: email,
      status: Formz.validate([state.email]),
    ));
  }

  void _onConfirmFormEmailChanged(
    ConfirmFormEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    print('_onConfirmFormEmailChanged');
    final email = Email.dirty(event.email);
    print('${state.email}, ${state.password}   ${state.confirmCode} ');
    emit(state.copyWith(
      email: email,
      status: Formz.validate([state.email, state.password, state.confirmCode]),
    ));
  }

  void _onConfirmFormPasswordChanged(
    ConfirmFormPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    print('_onConfirmFormPasswordChanged');
    final password = Password.dirty(event.password);
    print('${state.email}, ${state.password}   ${state.confirmCode} ');
    emit(state.copyWith(
      password: password,
      status: Formz.validate([state.email, state.password, state.confirmCode]),
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
        state.firstname,
        state.lastname,
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
        state.firstname,
        state.lastname,
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
        state.firstname,
        state.lastname,
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
        _repoResponse = await _authenticationRepository.logInUser(
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
  //=======================
  //

  void _onConfirmCodeSubmitted(
    ConfirmCodeSubmitted event,
    Emitter<LoginState> emit,
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

  //-==========

  void _onResendConfirmCodeSubmitted(
    ResendConfirmCodeSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    print('formstate: ${state.status}');
    print(state.email.value + ' password: ' + state.password.value);
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
      _repoResponse = await _authenticationRepository.resendVerficationCode(
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
  //========================

//-==========

  void _onForgotPasswordSubmitted(
    ForgotPasswordSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    print('formstate: ${state.status}');
    print(state.email.value + ' password: ' + state.password.value);
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
      _repoResponse = await _authenticationRepository.forgotpassword(
          email: state.email.value);

      _repoResponse.fold((left) {
        print('left');
        // return (left);
        print(left.toJson().toString());
        emit(state.copyWith(
            status: FormzStatus.submissionSuccess,
            errMsg: left.toJson().toString()));
      }, (right) {
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

//===
  void _onSignUpSubmited(
    SignUpSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    print('formstate: ${state.status}');
    if (!state.status.isValidated) {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure,
          errMsg: 'Inpuut Data Error!!'));
      return;
    }
    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    final dartz.Either<TokenPair, ApiError> _repoResponse;

    print('_SignUpSubmitted');
    print(state.toString());

    if (state.password.value != state.confirmPassword.value) {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure,
          errMsg: 'Confirm Password Not Equal Password!!'));
      return;
    }

    try {
      //TokenPair _tokenInfo;
      _repoResponse = await _authenticationRepository.signUpUser(
        firstname: state.firstname.value,
        lastname: state.lastname.value,
        mobile: state.mobile.value,
        email: state.email.value,
        password: state.password.value,
      );

      _repoResponse.fold((left) {
        print('left');
        // return (left);
        print(left.toJson().toString());
        emit(state.copyWith(
            status: FormzStatus.submissionSuccess,
            errMsg: left.toJson().toString()));
      }, (right) {
        print('right');
        emit(state.copyWith(
            status: FormzStatus.submissionFailure,
            errMsg: right.toJson().toString()));

        //return (right);
      });
    } catch (err) {
      print('Error From server ' + err.toString());
      rethrow;
      // showInSnackBar(context, err.toString());
    }
  }
}
