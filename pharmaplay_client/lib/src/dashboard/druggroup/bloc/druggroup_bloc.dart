import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:pharma_repository/pharma_repository.dart';
import 'package:pharmaplay_client/generated/l10n.dart';
import 'package:dartz/dartz.dart' as dartz;
part 'druggroup_event.dart';
part 'druggroup_state.dart';

class DrugGroupBloc extends Bloc<DrugGroupEvent, DrugGroupState> {
  DrugGroupBloc({
    required PharmaRepository pharmaRepository,
  })  : _pharmaRepository = pharmaRepository,
        super(const DrugGroupState()) {
    on<LocalUIChanged>(_onLocalUIChanged);
    on<DrugGroupGetAll>(_onDrugGroupGetAll);

    // on<RoutToSignUpPageSubmitted>(_onRoutToSignUpPageSubmitted);
  }

  final PharmaRepository _pharmaRepository;

  void _onLocalUIChanged(
    LocalUIChanged event,
    Emitter<DrugGroupState> emit,
  ) {
    //print(SLang.current.onforgotemailchanged);

    print('${event.localUI},   ');
    emit(state.copyWith(
      localUI: event.localUI,
      status: DrugGroupStatus.success,
    ));
    add(const DrugGroupGetAll());
  }

//-==========

  void _onDrugGroupGetAll(
    DrugGroupGetAll event,
    Emitter<DrugGroupState> emit,
  ) async {
    print('_onDrugGroupGetAll: ${state.status}');
    // print(state.email.value + ' password: ' + state.password.value);

    emit(state.copyWith(
        status: DrugGroupStatus.loading, errMsg: 'loading.....'));

//-----------------
    final dartz.Either<List<DrugGroup>, ApiError> _repoResponse;
    try {
      //TokenPair _tokenInfo;
      _repoResponse =
          await _pharmaRepository.getDrugGroupAll(localUI: state.localUI);

      _repoResponse.fold((left) {
        print('left from PAi get back');
        // return (left);
        print(left.toString());
        emit(
          state.copyWith(
              status: DrugGroupStatus.success,
              drugGroups: left,
              errMsg: 'All  Drug Group Loaded'),
        );
      }, (right) {
        print('right');
        emit(state.copyWith(
            status: DrugGroupStatus.failed, errMsg: right.toJson().toString()));

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
