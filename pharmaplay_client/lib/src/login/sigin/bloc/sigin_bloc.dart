import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:pharmaplay_client/generated/l10n.dart';
import 'package:pharmaplay_client/src/login/models/models.dart';
//import 'package:pharmaplay_client/src/login/login.dart';

part 'sigin_event.dart';
part 'sigin_state.dart';

class SiginBloc extends Bloc<SiginEvent, SiginState> {
  SiginBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const SiginState()) {
    on<SiginEmailChanged>(_onSiginEmailChanged);

    on<SiginPasswordChanged>(_onSiginPasswordChanged);

    on<LoginSubmitted>(_onLoginSubmitted);
    on<SiginForgotPasswordSubmitted>(_onSiginForgotPasswordSubmitted);

    // on<RoutToSignUpPageSubmitted>(_onRoutToSignUpPageSubmitted);
  }

  final AuthenticationRepository _authenticationRepository;

  void _onSiginEmailChanged(
    SiginEmailChanged event,
    Emitter<SiginState> emit,
  ) {
    print('_onEmailChanged');
    final email = Email.dirty(event.email);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([state.password, email]),
    ));
  }

  void _onSiginPasswordChanged(
    SiginPasswordChanged event,
    Emitter<SiginState> emit,
  ) {
    print('_onpasswordChanged');
    final password = Password.dirty(event.password);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([password, state.email]),
    ));
  }

  void _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<SiginState> emit,
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

  void _onSiginForgotPasswordSubmitted(
    SiginForgotPasswordSubmitted event,
    Emitter<SiginState> emit,
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
    SiginSignUpSubmitted event,
    Emitter<SiginState> emit,
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

    print('_SiginSignUpSubmitted');
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
