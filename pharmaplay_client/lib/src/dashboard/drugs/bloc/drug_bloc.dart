import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/locale.dart';
import 'package:pharma_repository/pharma_repository.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:pharmaplay_client/src/dashboard/dashboard.dart';
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
  final PharmaRepository _pharmaRepository;
  late StreamSubscription<DashBoardState> dashBoardStateubscription;

  DrugBloc({
    required DashBoardBloc dashBoardBlod,
    required PharmaRepository pharmaRepository,
  })  : _pharmaRepository = pharmaRepository,
        super(const DrugState()) {
    on<DruglocaleUIChanged>(_onDruglocaleUIChanged);
    on<DrugsSearched>(
      _onDrugsSearched,
      transformer: throttleDroppable(throttleDuration),
    );
    on<DrugsScrolledd>(
      _onDrugsScrolledd,
      transformer: throttleDroppable(throttleDuration),
    );

    dashBoardStateubscription = dashBoardBlod.stream.listen((state) {
      if (state.status == 'localeUIChanged') {
        print(' -----------------    dashBoardStateubscription  ' +
            state.localeUI.toString());
        add(DruglocaleUIChanged(state.localeUI.toString()));
      }
      if (state.status == 'InitSubBlocs') {
        print(' ------------druggroup-----    InitSubBlocs  ' +
            state.localeUI.toString());
        add(DrugsSearched(
            drugStatus: DrugStatus.initializing,
            localeUI: state.localeUI.toString()));
      }
    });
  }
  void _onDruglocaleUIChanged(
    DruglocaleUIChanged event,
    Emitter<DrugState> emit,
  ) {
    //print(SLang.current.onforgotemailchanged);

    print(
        '_onDruglocaleUIChanged ======================= ${event.localeUI},   ');

    emit(state.copyWith(
      localeUI: event.localeUI,
      //status: DrugStatus.success,
    ));
    //add(const DrugGetAll());
  }

//-==========
/*


*/
//===

  void _onDrugsSearched(
    DrugsSearched event,
    Emitter<DrugState> emit,
  ) async {
    print(
        '_onDrugsSearched LOCALEUIIIIIIIIIIIIIIIIIIIIIIIIIII :  ${state.localeUI} + WhewrCond:::: ${event.whereCond} ');

    final dartz.Either<List<DrugRecord>, ApiError> _repoResponse;
    try {
      //TokenPair _tokenInfo;
      _repoResponse = await _pharmaRepository.getDrugsSearch(
          startFromPage: "1",
          pageLength: state.pageLength.toString(),
          orderByFields: event.orderByFields ?? '',
          localeUI: state.localeUI,
          whereCond: event.whereCond ?? '',
          serachValue: event.serachValue ?? '',
          searchType: event.searchType ?? SearchType.none);

      _repoResponse.fold((left) {
        print('left from PAi get back');
        print(left.toString());

        emit(state.copyWith(
          status: DrugStatus.success,
          hasReachedMax: left.isEmpty,
          drugs: left,
          whereCond: event.whereCond ?? '',
          startFrompage: 1,
          currentPage: 1,
          serachValue: event.serachValue ?? '',
          searchType: event.searchType ?? SearchType.none,
          orderByFields: event.orderByFields ?? '',
        ));
      }, (right) {
        print('right');
        emit(state.copyWith(
            status: DrugStatus.failed, stateMsg: right.toJson().toString()));
      });
    } catch (err) {
      print('Error connectiing to server ' + err.toString());
      rethrow;
    }
  }
  //===

//-----------------
  Future<void> _onDrugsScrolledd(
    DrugsScrolledd event,
    Emitter<DrugState> emit,
  ) async {
    if (state.hasReachedMax) return;

    //final DrugStatus _drugStatus = DrugStatus.scrolloading;

    final dartz.Either<List<DrugRecord>, ApiError> _repoResponse;
    try {
      //TokenPair _tokenInfo;
      _repoResponse = await _pharmaRepository.getDrugsSearch(
          startFromPage: (state.currentPage + 1).toString(),
          pageLength: state.pageLength.toString(),
          orderByFields: state.orderByFields,
          localeUI: state.localeUI,
          whereCond: state.whereCond,
          serachValue: state.serachValue,
          searchType: state.searchType);

      _repoResponse.fold((left) {
        print('left from PAi get back');
        print(left.toString());

        emit(state.copyWith(
          status: DrugStatus.success,
          hasReachedMax: left.isEmpty,
          drugs: (List.of(state.drugs)..addAll(left)),
          currentPage: state.currentPage + 1,
        ));
      }, (right) {
        print('right');
        emit(state.copyWith(
            status: DrugStatus.failed,
            // drugs: state.drugs,
            stateMsg: right.toJson().toString()));

        //return (right);
      });
    } catch (err) {
      print('Error connectiing to server ' + err.toString());
      rethrow;
      // showInSnackBar(context, err.toString());
    }
  }

//--------------
/*  void _onDrugsSearched(
    DrugsSearched event,
    Emitter<DrugState> emit,
  ) async {
    print(
        '_onDrugsSearched LOCALEUIIIIIIIIIIIIIIIIIIIIIIIIIII :  ${state.localeUI} + WhewrCond:::: ${event.whereCond} ');
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
          localeUI: state.localeUI, whereCond: _wereCond);

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
