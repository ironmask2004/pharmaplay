import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:pharmaplay_client/src/login/login.dart';
import 'package:pharmaplay_client/src/login/models/email.dart';
import 'package:dartz/dartz.dart' as dartz;

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const LoginState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
  }

  final AuthenticationRepository _authenticationRepository;

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
      final dartz.Either<TokenPair, ApiError> _loginResponse;
      try {
        //TokenPair _tokenInfo;
        _loginResponse = await _authenticationRepository.logIn(
            email: state.email.value, password: state.password.value);

        _loginResponse.fold((left) {
          print('left');
          // return (left);
          print(left.toJson().toString());
          emit(state.copyWith(status: FormzStatus.submissionSuccess));
        }, (right) {
          //showInSnackBar(context, ("Login Successs!!"));
          print('right');
          emit(state.copyWith(status: FormzStatus.submissionFailure));

          //return (right);
        });
      } catch (err) {
        print('Error connectiing to server ' + err.toString());
        rethrow;
        // showInSnackBar(context, err.toString());
      }

//-----------------

      /* try {
        await _authenticationRepository.logIn(
            email: state.email.value,
            password: state.password.value,
            baseUrl: 'baseurl');
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    */
    }
  }
}
