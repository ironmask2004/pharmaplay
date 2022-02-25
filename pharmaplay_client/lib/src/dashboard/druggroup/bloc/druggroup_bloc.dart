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
    on<DrugGroupGetSearch>(_onDrugGroupGetSearch);

    // on<RoutToSignUpPageSubmitted>(_onRoutToSignUpPageSubmitted);
  }

  final PharmaRepository _pharmaRepository;
  // String _localUI = 'en';

  void _onLocalUIChanged(
    LocalUIChanged event,
    Emitter<DrugGroupState> emit,
  ) {
    //print(SLang.current.onforgotemailchanged);

    print('_onLocalUIChanged ======================= ${event.localUI},   ');

    emit(state.copyWith(
      localUI: event.localUI,
      status: DrugGroupStatus.success,
    ));
    //add(const DrugGroupGetAll());
  }

//-==========
/*
  ''' "wherecond": " Where similarity (drugGroup.\\"ar__drugGroupName\\",'$_serachValue' )  > 0.2  OR similarity (drugGroup.\\"en__drugGroupName\\",'$_serachValue' )  > 0.2  "  '''));

*/
  void _onDrugGroupGetSearch(
    DrugGroupGetSearch event,
    Emitter<DrugGroupState> emit,
  ) async {
    print(
        '_onDrugGroupGetSearch LOCALEUIIIIIIIIIIIIIIIIIIIIIIIIIII :  ${state.localUI} + WhewrCond:::: ${event.whereCond} ');
    // print(state.email.value + ' password: ' + state.password.value);
    var _WereCond =
        ''' "wherecond": " Where similarity (drugGroup.\\"ar__drugGroupName\\",'${event.whereCond}' )  > 0.2  OR similarity (drugGroup.\\"en__drugGroupName\\",'${event.whereCond}' )  > 0.2  "  ''';

    _WereCond =
        ''' "wherecond": " Where    drugGroup.\\"ar__drugGroupName\\" like '%${event.whereCond}%'  OR  lower ( drugGroup.\\"en__drugGroupName\\") LIKE  lower ('%${event.whereCond}%') " ''';

    emit(state.copyWith(
        status: DrugGroupStatus.loading, errMsg: 'loading.....'));

//-----------------
    final dartz.Either<List<DrugGroup>, ApiError> _repoResponse;
    try {
      //TokenPair _tokenInfo;
      _repoResponse = await _pharmaRepository.getDrugGroupAll(
          localUI: state.localUI, whereCond: _WereCond);

      _repoResponse.fold((left) {
        print('left from PAi get back');
        // return (left);
        print(left.toString());
        emit(
          state.copyWith(
              status: DrugGroupStatus.success,
              drugGroups: left,
              whereCond: event.whereCond,
              errMsg: 'All  Drug Group Loaded'),
        );
      }, (right) {
        print('right');
        emit(state.copyWith(
            status: DrugGroupStatus.failed,
            drugGroups: [],
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

  void _onDrugGroupGetAll(
    DrugGroupGetAll event,
    Emitter<DrugGroupState> emit,
  ) async {
    print(
        '_onDrugGroupGetAll LOCALEUIIIIIIIIIIIIIIIIIIIIIIIIIII :  ${state.localUI}');
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
