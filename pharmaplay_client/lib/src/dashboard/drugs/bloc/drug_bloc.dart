import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:pharma_repository/pharma_repository.dart';
import 'package:pharmaplay_client/generated/l10n.dart';
import 'package:dartz/dartz.dart' as dartz;
part 'drug_event.dart';
part 'drug_state.dart';

class DrugBloc extends Bloc<DrugEvent, DrugState> {
  DrugBloc({
    required PharmaRepository pharmaRepository,
  })  : _pharmaRepository = pharmaRepository,
        super(const DrugState()) {
    on<DrugLocalUIChanged>(_onDrugLocalUIChanged);
    on<DrugGetAll>(_onDrugGetAll);
    on<DrugGetSearch>(_onDrugGetSearch);

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
    emit(state.copyWith(status: DrugStatus.loading, errMsg: 'loading.....'));

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
              whereCond: event.whereCond,
              errMsg: 'All  Drug Group Loaded'),
        );
      }, (right) {
        print('right');
        emit(state.copyWith(
            status: DrugStatus.failed,
            drugs: [],
            errMsg: right.toJson().toString()));

        //return (right);
      });
    } catch (err) {
      print('Error connectiing to server ' + err.toString());
      rethrow;
      // showInSnackBar(context, err.toString());
    }
  }
//================

  void _onDrugGetAll(
    DrugGetAll event,
    Emitter<DrugState> emit,
  ) async {
    print(
        '_onDrugGetAll LOCALEUIIIIIIIIIIIIIIIIIIIIIIIIIII :  ${state.localUI}');
    // print(state.email.value + ' password: ' + state.password.value);

    emit(state.copyWith(status: DrugStatus.loading, errMsg: 'loading.....'));

//-----------------
    final dartz.Either<List<DrugRecord>, ApiError> _repoResponse;
    try {
      //TokenPair _tokenInfo;
      _repoResponse =
          await _pharmaRepository.getDrugAll(localUI: state.localUI);

      _repoResponse.fold((left) {
        print('left from PAi get back');
        // return (left);
        print(left.toString());
        emit(
          state.copyWith(
              status: DrugStatus.success,
              drugs: left,
              errMsg: 'All  Drug Group Loaded'),
        );
      }, (right) {
        print('right');
        emit(state.copyWith(
            status: DrugStatus.failed, errMsg: right.toJson().toString()));

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
