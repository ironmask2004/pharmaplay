import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:pharmaplay_client/generated/l10n.dart';
import 'package:dartz/dartz.dart' as dartz;

import '../../login.dart';
//import 'package:pharmaplay_client/generated/l10n.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const ForgotPasswordState()) {
    on<ForgotEmailChanged>(_onforgotEmailChanged);
    on<ForgotPasswordSubmitted>(_onForgotPasswordSubmitted);

    // on<RoutToSignUpPageSubmitted>(_onRoutToSignUpPageSubmitted);
  }

  final AuthenticationRepository _authenticationRepository;

  void _onforgotEmailChanged(
    ForgotEmailChanged event,
    Emitter<ForgotPasswordState> emit,
  ) {
    print(SLang.current.onforgotemailchanged);

    final email = Email.dirty(event.email);
    print('${state.email},   ');
    emit(state.copyWith(
      email: email,
      status: Formz.validate([state.email]),
    ));
  }

//-==========

  void _onForgotPasswordSubmitted(
    ForgotPasswordSubmitted event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    print('formstate: ${state.status}');
    // print(state.email.value + ' password: ' + state.password.value);
    if (!state.status.isValidated) {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure,
          errMsg: 'Inpuut Data Error!!'));
      return;
    }
    emit(state.copyWith(
        status: FormzStatus.submissionInProgress,
        errMsg: 'submissionInProgress!!'));
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
            errMsg: 'new PAssword Has Been cent to your Email'));
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

}
