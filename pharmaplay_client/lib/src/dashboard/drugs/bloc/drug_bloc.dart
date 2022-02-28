import 'package:bloc/bloc.dart';
import 'package:pharma_repository/pharma_repository.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:stream_transform/stream_transform.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'drug_state.dart';
part 'drug_event.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class DrugBloc extends Bloc<DrugEvent, DrugState> {
  DrugBloc({
    required PharmaRepository pharmaRepository,
  })  : _pharmaRepository = pharmaRepository,
        super(const DrugState()) {
    on<DrugLocalUIChanged>(_onDrugLocalUIChanged);
    on<DrugGetSearch>(_onDrugGetSearch);
    on<DrugFetched>(
      _onDrugFetched,
      transformer: throttleDroppable(throttleDuration),
    );

    // on<RoutToSignUpPageSubmitted>(_onRoutToSignUpPageSubmitted);
  }

  final PharmaRepository _pharmaRepository;
  // String _localUI = 'en';

  void _onDrugLocalUIChanged(
    DrugLocalUIChanged event,
    Emitter<DrugState> emit,
  ) {
    //print(SLang.current.onforgotemailchanged);

    print('_onDrugLocalUIChanged ======================= ${event.localUI},   ');

    emit(state.copyWith(
      localUI: event.localUI,
      status: DrugStatus.success,
    ));
    //add(const DrugGetAll());
  }

//-==========
/*
  ''' "wherecond": " Where similarity (drug.\\"ar__drugName\\",'$_serachValue' )  > 0.2  OR similarity (drug.\\"en__drugName\\",'$_serachValue' )  > 0.2  "  '''));

*/

  Future<void> _onDrugFetched(
    DrugFetched event,
    Emitter<DrugState> emit,
  ) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == DrugStatus.initializing) {
        final drugs = await _fetchDrugs();
        return emit(state.copyWith(
          status: DrugStatus.success,
          drugs: drugs,
          hasReachedMax: false,
        ));
      }
      final drugs = await _fetchDrugs(state.drugs.length);
      drugs.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: DrugStatus.success,
                drugs: List.of(state.drugs)..addAll(drugs),
                hasReachedMax: false,
              ),
            );
    } catch (_) {
      emit(state.copyWith(status: DrugStatus.failure));
    }
  }
//''================

  Future<List<Drug>> _fetchDrugs(
    DrugState state,
  ) async {
    print(
        '_onDrugGetSearch LOCALEUIIIIIIIIIIIIIIIIIIIIIIIIIII :  ${state.localUI} + WhewrCond:::: ${event.whereCond} ');
    // print(state.email.value + ' password: ' + state.password.value);
    // _WereCond =
    //    ''' "wherecond": " Where similarity (drug.\\"ar__drugName\\",'${event.whereCond}' )  > 0.2  OR similarity (drug.\\"en__drugName\\",'${event.whereCond}' )  > 0.2  "  ''';

    var _wereCond =
        ''' "wherecond":  " Where    drug.\\"ar__brandName\\" like '%${event.whereCond}%'  OR  lower ( drug.\\"en__brandName\\") LIKE  lower ('%${event.whereCond}%')"  ''';

    print("----------------------------");
    print(_wereCond);
    print("----------------------------");
    emit(state.copyWith(status: DrugStatus.loading, stateMsg: 'loading.....'));

//-----------------
    final dartz.Either<List<DrugRecord>, ApiError> _repoResponse;
    try {
      //TokenPair _tokenInfo;
      _repoResponse = await _pharmaRepository.getDrugAll(
          localUI: state.localUI, whereCond: _wereCond);

      _repoResponse.fold((left) {
        print('left from PAi get back');
        return (left);
        print(left.toString());
        emit(
          state.copyWith(
              status: DrugStatus.success,
              drugs: left,
              whereCond: _wereCond,
              stateMsg: 'Drug Group Loaded'),
        );
      }, (right) {
        print('right');
        emit(state.copyWith(
            status: DrugStatus.failed,
            drugs: [],
            stateMsg: right.toJson().toString()));

        return (right);
      });
    } catch (err) {
      print('Error connectiing to server ' + err.toString());
      rethrow;
      // showInSnackBar(context, err.toString());
    }
  }
  //===

//--------------
  void _onDrugGetSearch(
    DrugGetSearch event,
    Emitter<DrugState> emit,
  ) async {
    print(
        '_onDrugGetSearch LOCALEUIIIIIIIIIIIIIIIIIIIIIIIIIII :  ${state.localUI} + WhewrCond:::: ${event.whereCond} ');
    // print(state.email.value + ' password: ' + state.password.value);
    // _WereCond =
    //    ''' "wherecond": " Where similarity (drug.\\"ar__drugName\\",'${event.whereCond}' )  > 0.2  OR similarity (drug.\\"en__drugName\\",'${event.whereCond}' )  > 0.2  "  ''';

    var _wereCond =
        ''' "wherecond":  " Where    drug.\\"ar__brandName\\" like '%${event.whereCond}%'  OR  lower ( drug.\\"en__brandName\\") LIKE  lower ('%${event.whereCond}%')"  ''';

    print("----------------------------");
    print(_wereCond);
    print("----------------------------");
    emit(state.copyWith(status: DrugStatus.loading, stateMsg: 'loading.....'));

//-----------------
    final dartz.Either<List<DrugRecord>, ApiError> _repoResponse;
    try {
      //TokenPair _tokenInfo;
      _repoResponse = await _pharmaRepository.getDrugAll(
          localUI: state.localUI, whereCond: _wereCond);

      _repoResponse.fold((left) {
        print('left from PAi get back');
        // return (left);
        print(left.toString());
        emit(
          state.copyWith(
              status: DrugStatus.success,
              drugs: left,
              whereCond: _wereCond,
              stateMsg: 'Drug Group Loaded'),
        );
      }, (right) {
        print('right');
        emit(state.copyWith(
            status: DrugStatus.failed,
            drugs: [],
            stateMsg: right.toJson().toString()));

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
