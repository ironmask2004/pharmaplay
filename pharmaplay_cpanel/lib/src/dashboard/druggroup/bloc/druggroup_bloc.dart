import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_repository/pharma_repository.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:pharmaplay_cpanel/src/dashboard/bloc/dashboard_bloc.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'druggroup_state.dart';
part 'druggroup_event.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class DrugGroupBloc extends Bloc<DrugGroupEvent, DrugGroupState> {
  final PharmaRepository _pharmaRepository;
  late StreamSubscription<DashBoardState> dashBoardStateubscription;

  DrugGroupBloc({
    required DashBoardBloc dashBoardBlod,
    required PharmaRepository pharmaRepository,
  })  : _pharmaRepository = pharmaRepository,
        super(const DrugGroupState()) {
    //Future.delayed(const Duration(seconds: 15));
    on<DrugGrouplocaleUIChanged>(_onDrugGrouplocaleUIChanged);
    on<DrugGroupInitialized>(_onDrugGroupInitialized);
    on<DrugGroupsSearched>(
      _onDrugGroupsSearched,
      transformer: throttleDroppable(throttleDuration),
    );
    on<DrugGroupsScrolledd>(
      _onDrugGroupsScrolledd,
      transformer: throttleDroppable(throttleDuration),
    );

    dashBoardStateubscription = dashBoardBlod.stream.listen((state) {
      print(' -----------------    dashBoardStateubscription  ' +
          state.toString());

      switch (state.status) {
        case 'localeUIChanged':
          print(' -----------------   druggroup dashBoardStateubscription  ' +
              state.localeUI.toString());
          add(DrugGrouplocaleUIChanged(state.localeUI.toString()));
          break;
        case 'InitSubBlocs':
          print(' ------------druggroup-----    InitSubBlocs  ' +
              state.localeUI.toString());
          add(DrugGroupsSearched(
              druggroupStatus: DrugGroupStatus.initializing,
              localeUI: state.localeUI.toString()));
          break;
        case 'HeaderSerachSubmitted':
          add(DrugGroupsSearched(
              druggroupStatus: DrugGroupStatus.initializing,
              searchType: SearchType.like,
              serachValue: state.headerSerachField));

          break;
      }
    });
  }
  @override
  Future<void> close() {
    dashBoardStateubscription.cancel();
    //_pharmaRepository.dispose();
    return super.close();
  }

  void _onDrugGrouplocaleUIChanged(
    DrugGrouplocaleUIChanged event,
    Emitter<DrugGroupState> emit,
  ) {
    //print(SLang.current.onforgotemailchanged);

    print(
        '_onDrugGrouplocaleUIChanged ----------========== ${event.localeUI},   ');

    emit(state.copyWith(
      localeUI: event.localeUI,
      //status: DrugGroupStatus.success,
    ));
    //add(const DrugGroupGetAll());
  }

  void _onDrugGroupInitialized(
    DrugGroupInitialized event,
    Emitter<DrugGroupState> emit,
  ) async {
    //print(SLang.current.onforgotemailchanged);

    print('_onDrugGroupInitialized ----------==========  ${state.localeUI}');

    emit(state.copyWith(
      status: DrugGroupStatus.initializing,
      // localeUI: event.localeUI,
      //status: DrugGroupStatus.success,
    ));
    //add(const DrugGroupGetAll());
  }

  void _onDrugGroupsSearched(
    DrugGroupsSearched event,
    Emitter<DrugGroupState> emit,
  ) async {
    print(
        '_onDrugGroupsSearched ------ LOCALEUIIIIIIIIIIIIIIIIIIIIIIIIIII :  ${state.localeUI} + WhewrCond:::: ${event.whereCond} ');

    print('=======================  ===  state serach ' +
        state.serachValue +
        ' new Searched value: ' +
        event.serachValue!);

    if (((event.serachValue != '') &&
        (event.serachValue == state.serachValue))) {
      print(
          '=======================  return without search !!!!!!!!!!!!1 ${event.serachValue}');
      return;
    }

    final dartz.Either<List<DrugGroup>, ApiError> _repoResponse;
    try {
      //TokenPair _tokenInfo;
      _repoResponse = await _pharmaRepository.getDrugGroupsSearch(
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
          status: DrugGroupStatus.success,
          hasReachedMax: left.isEmpty,
          drugGroups: left,
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
            status: DrugGroupStatus.failed,
            stateMsg: right.toJson().toString()));
      });
    } catch (err) {
      print('Error connectiing to server ' + err.toString());
      rethrow;
    }
  }
  //===

//-----------------
  Future<void> _onDrugGroupsScrolledd(
    DrugGroupsScrolledd event,
    Emitter<DrugGroupState> emit,
  ) async {
    if (state.hasReachedMax) return;

    //final DrugGroupStatus _drugStatus = DrugGroupStatus.scrolloading;
    emit(state.copyWith(status: DrugGroupStatus.scrolloading));

    final dartz.Either<List<DrugGroup>, ApiError> _repoResponse;
    try {
      //TokenPair _tokenInfo;
      _repoResponse = await _pharmaRepository.getDrugGroupsSearch(
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
          status: DrugGroupStatus.success,
          hasReachedMax: left.isEmpty,
          drugGroups: (List.of(state.drugGroups)..addAll(left)),
          currentPage: state.currentPage + 1,
        ));
      }, (right) {
        print('right');
        emit(state.copyWith(
            status: DrugGroupStatus.failed,
            // druggroups: state.druggroups,
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
/*  void _onDrugGroupsSearched(
    DrugGroupsSearched event,
    Emitter<DrugGroupState> emit,
  ) async {
    print(
        '_onDrugGroupsSearched LOCALEUIIIIIIIIIIIIIIIIIIIIIIIIIII :  ${state.localeUI} + WhewrCond:::: ${event.whereCond} ');
    // print(state.email.value + ' password: ' + state.password.value);
    // _WereCond =
    //    ''' "wherecond": " Where similarity (drug.\\"ar__drugName\\",'${event.whereCond}' )  > 0.2  OR similarity (drug.\\"en__drugName\\",'${event.whereCond}' )  > 0.2  "  ''';

    var _wereCond =
        ''' "wherecond":  " Where    drug.\\"ar__brandName\\" like '%${event.whereCond}%'  OR  lower ( drug.\\"en__brandName\\") LIKE  lower ('%${event.whereCond}%')"  ''';

    print("----------------------------");
    print(_wereCond);
    print("----------------------------");
    emit(state.copyWith(status: DrugGroupStatus.loading, stateMsg: 'loading.....'));

//-----------------
    final dartz.Either<List<DrugGroup>, ApiError> _repoResponse;
    try {
      //TokenPair _tokenInfo;
      _repoResponse = await _pharmaRepository.getDrugGroupAll(
          localeUI: state.localeUI, whereCond: _wereCond);

      _repoResponse.fold((left) {
        print('left from PAi get back');
        // return (left);
        print(left.toString());
        emit(
          state.copyWith(
              status: DrugGroupStatus.success,
              druggroups: left,
              whereCond: _wereCond,
              stateMsg: 'DrugGroup Group Loaded'),
        );
      }, (right) {
        print('right');
        emit(state.copyWith(
            status: DrugGroupStatus.failed,
            druggroups: [],
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
