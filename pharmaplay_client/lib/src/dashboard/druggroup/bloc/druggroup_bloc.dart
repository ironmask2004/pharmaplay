import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_repository/pharma_repository.dart';
import 'package:dartz/dartz.dart' as dartz;
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
  DrugGroupBloc({
    required PharmaRepository pharmaRepository,
  })  : _pharmaRepository = pharmaRepository,
        super(const DrugGroupState()) {
    on<DrugGroupLocalUIChanged>(_onDrugGroupLocalUIChanged);
    on<DrugGroupsSearched>(
      _onDrugGroupsSearched,
      transformer: throttleDroppable(throttleDuration),
    );
    on<DrugGroupsScrolledd>(
      _onDrugGroupsScrolledd,
      transformer: throttleDroppable(throttleDuration),
    );

    // on<RoutToSignUpPageSubmitted>(_onRoutToSignUpPageSubmitted);
  }

  final PharmaRepository _pharmaRepository;
  // String _localUI = 'en';

  void _onDrugGroupLocalUIChanged(
    DrugGroupLocalUIChanged event,
    Emitter<DrugGroupState> emit,
  ) {
    //print(SLang.current.onforgotemailchanged);

    print(
        '_onDrugGroupLocalUIChanged ======================= ${event.localUI},   ');

    emit(state.copyWith(
      localUI: event.localUI,
      //status: DrugGroupStatus.success,
    ));
    //add(const DrugGroupGetAll());
  }

  void _onDrugGroupsSearched(
    DrugGroupsSearched event,
    Emitter<DrugGroupState> emit,
  ) async {
    print(
        '_onDrugGroupsSearched LOCALEUIIIIIIIIIIIIIIIIIIIIIIIIIII :  ${state.localUI} + WhewrCond:::: ${event.whereCond} ');

    final dartz.Either<List<DrugGroup>, ApiError> _repoResponse;
    try {
      //TokenPair _tokenInfo;
      _repoResponse = await _pharmaRepository.getDrugGroupsSearch(
          startFromPage: "1",
          pageLength: state.pageLength.toString(),
          orderByFields: event.orderByFields ?? '',
          localUI: state.localUI,
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

    final dartz.Either<List<DrugGroup>, ApiError> _repoResponse;
    try {
      //TokenPair _tokenInfo;
      _repoResponse = await _pharmaRepository.getDrugGroupsSearch(
          startFromPage: (state.currentPage + 1).toString(),
          pageLength: state.pageLength.toString(),
          orderByFields: state.orderByFields,
          localUI: state.localUI,
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
        '_onDrugGroupsSearched LOCALEUIIIIIIIIIIIIIIIIIIIIIIIIIII :  ${state.localUI} + WhewrCond:::: ${event.whereCond} ');
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
          localUI: state.localUI, whereCond: _wereCond);

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
