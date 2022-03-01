import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_repository/pharma_repository.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:pharmaplay_client/src/utlites/common_classes.dart';
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
    //on<DrugGetSearch>(_onDrugGetSearch);
    on<DrugsFetched>(
      _onDrugsFetched,
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

  Future<void> _onDrugsFetched(
    DrugsFetched event,
    Emitter<DrugState> emit,
  ) async {
    if (state.hasReachedMax) return;
    try {
      print('--------------${state.status}-----------------');

      if (event.status == DrugStatus.initializing) {
        final drugsRecords = await _fetchDrugs(
            localUI: event.localUI,
            whereCond: event.whereCond,
            startFrompage: event.startFrompage,
            pageLength: event.pageLength,
            searchType: event.searchType,
            serachValue: event.serachValue,
            orderByFields: event.orderByFields);
        print(
            '--------------------------------iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii');
        print(drugsRecords);
        return emit(state.copyWith(
          status: DrugStatus.success,
          drugs: drugsRecords,
          hasReachedMax: false,
          localUI: event.localUI,
          whereCond: event.whereCond,
          startFrompage: event.startFrompage,
          currentPage: 1,
          pageLength: event.pageLength,
          searchType: event.searchType,
          serachValue: event.serachValue,
          orderByFields: event.orderByFields,
        ));
      }
      final drugsRecords = await _fetchDrugs(
          localUI: event.localUI,
          whereCond: event.whereCond,
          startFrompage: event.startFrompage,
          pageLength: event.pageLength,
          searchType: event.searchType,
          serachValue: event.serachValue,
          orderByFields: event.orderByFields);
      print('RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR');
      drugsRecords.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: DrugStatus.success,
                currentPage: state.currentPage + 1,
                drugs: List.of(state.drugs)..addAll(drugsRecords),
                hasReachedMax: false,
              ),
            );
      print('RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR');

      print(state.currentPage);
      print(state.drugs);
    } catch (_) {
      emit(state.copyWith(status: DrugStatus.failed));
    }
  }

//''================

  Future<List<DrugRecord>> _fetchDrugs(
      {String? localUI,
      String? whereCond,
      int? startFrompage,
      int? pageLength,
      SearchType? searchType,
      String? serachValue,
      String? orderByFields}) async {
//-----------------
    final dartz.Either<List<DrugRecord>, ApiError> _repoResponse;
    try {
      //TokenPair _tokenInfo;
      _repoResponse = await _pharmaRepository.getDrugsSearch(
          startFromPage: startFrompage.toString(),
          pageLength: pageLength.toString(),
          orderByFields: orderByFields,
          localUI: localUI,
          whereCond: whereCond,
          searcValue: serachValue,
          searchType: searchType.toString());

      _repoResponse.fold((left) {
        print('left from PAi get drugs back');

        print(left.toString());
        return (left);
      }, (right) {
        print('right');
        // emit(state.copyWith(
        //     status: DrugStatus.failed,
        //     drugs: [],
        //     stateMsg: right.toJson().toString()));

        return ([]);
      });
    } catch (err) {
      print('Error connectiing to server ' + err.toString());
      return ([]);
      // showInSnackBar(context, err.toString());
    }
    return ([]);
  }
  //===

//--------------
/*  void _onDrugGetSearch(
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
*/
}
