import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/locale.dart';
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
    on<DrugGetSearch>(
      _onDrugGetSearch,
      transformer: throttleDroppable(throttleDuration),
    );
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
      //status: DrugStatus.success,
    ));
    //add(const DrugGetAll());
  }

//-==========
/*


*/
//===

  void _onDrugGetSearch(
    DrugGetSearch event,
    Emitter<DrugState> emit,
  ) async {
    int _startFromPage = 1;
    int _currentPage = 1;
    int _pageLength = 10;
    String _localUI = 'en';
    String _serachValue = '';
    String _orderByFields = '';
    SearchType _searchType = SearchType.none;

    if (event.drugStatus == DrugStatus.initializing) {
      _startFromPage = 1;
      _currentPage = 1;
      _pageLength = event.pageLength ?? state.pageLength;
      // orderByFields: event.orderByFields,
      _localUI = state.localUI;
      // whereCond: event.whereCond,
      _serachValue = event.serachValue ?? '';
      _searchType = event.searchType ?? SearchType.none;
    } else if (event.drugStatus == DrugStatus.scrolloading) {
      if (state.hasReachedMax) return;
      _startFromPage = state.currentPage + 1;
      _pageLength = state.pageLength;
      _currentPage = state.currentPage;
      // orderByFields: event.orderByFields,
      _localUI = state.localUI;
      // whereCond: event.whereCond,
      _serachValue = state.serachValue;
      _searchType = state.searchType;
      _orderByFields = state.orderByFields;
    }

    print(
        '_onDrugGetSearch LOCALEUIIIIIIIIIIIIIIIIIIIIIIIIIII :  ${state.localUI} + WhewrCond:::: ${event.whereCond} ');

    final dartz.Either<List<DrugRecord>, ApiError> _repoResponse;
    try {
      //TokenPair _tokenInfo;
      _repoResponse = await _pharmaRepository.getDrugsSearch(
          startFromPage: _startFromPage.toString(),
          pageLength: _pageLength.toString(),
          // orderByFields: event.orderByFields,
          localUI: _localUI,
          // whereCond: event.whereCond,
          searcValue: _serachValue,
          searchType: _searchType);

      _repoResponse.fold((left) {
        print('left from PAi get back');
        // return (left);
        print(left.toString());

        emit(state.copyWith(
          status: DrugStatus.success,
          hasReachedMax:
              event.drugStatus == DrugStatus.scrolloading && left.isEmpty,
          drugs: event.drugStatus == DrugStatus.scrolloading
              ? (List.of(state.drugs)..addAll(left))
              : left,
          localUI: event.localUI,
          //  whereCond: _whereCo,
          startFrompage: _startFromPage,
          currentPage: event.drugStatus == DrugStatus.scrolloading
              ? _currentPage + 1
              : 1,
          pageLength: _pageLength,
          searchType: _searchType,
          serachValue: _serachValue,
          orderByFields: _orderByFields,
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
  //===

//-----------------
  Future<void> _onDrugsFetched(
    DrugsFetched event,
    Emitter<DrugState> emit,
  ) async {
    print(
        '-------_onDrugsFetched-------${state.status}-----------------------------------------------------------------');
    if (state.hasReachedMax) return;
    try {
      List<DrugRecord> drugsRecords;

      if (state.status == DrugStatus.empty) {
        drugsRecords = await _fetchDrugs(
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
      drugsRecords = await _fetchDrugs(
          localUI: event.localUI,
          whereCond: event.whereCond,
          startFrompage: event.startFrompage,
          pageLength: event.pageLength,
          searchType: event.searchType,
          serachValue: event.serachValue,
          orderByFields: event.orderByFields);
      print('RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR');
      print(drugsRecords);
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
    } catch (err) {
      print(err.toString());
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
          searchType: searchType);

      _repoResponse.fold((left) {
        print('left from PAi get drugs back');

        print(
            'llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll' +
                left.toString());
        print('back from left 333 ');

        return (left);
      }, (right) {
        print('right');
        // emit(state.copyWith(
        //     status: DrugStatus.failed,
        //     drugs: [],
        //     stateMsg: right.toJson().toString()));
        return (right);
      });
    } catch (err) {
      print('Error connectiing to server ' + err.toString());
      throw (err); // showInSnackBar(context, err.toString());
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
