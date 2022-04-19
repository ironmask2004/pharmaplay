import 'package:pharma_repository/pharma_repository.dart';
import 'package:dartz/dartz.dart' as dartz;

class DataLists {
  late List<DrugGroup> drugroups;
  late List<DrugGroup> drugroupsString;
  late final String _localeUI;
  late final PharmaRepository _pharmaRepository;

  DataLists(
      {required PharmaRepository pharmaRepository, required String localeUI})
      : _pharmaRepository = pharmaRepository,
        _localeUI = localeUI;

  Future<List<String>> get getDrugroupsStrings async {
    var resault = await getDrugroups;
    print('------------eeeee-----:' + resault.toString());
    return resault
        .map((e) => ('{${e.drugGroupName.trim()} , ${e.drugGroupID}}'))
        .toList();
  }

  Future<List<DrugGroup>> get getDrugroups async {
    final dartz.Either<List<DrugGroup>, ApiError> _repoResponse;
    try {
      List<DrugGroup> returnVal = [];
      //TokenPair _tokenInfo;
      print('llllllllllllllllllllocaleUIIIII: ' + _localeUI);
      _repoResponse = await _pharmaRepository.getDrugGroupsSearch(
          startFromPage: "1",
          pageLength: '100000',
          orderByFields: '',
          localeUI: _localeUI, //state.localeUI,
          whereCond: '', //event.whereCond ?? '',
          serachValue: '', // event.serachValue ?? '',
          searchType: SearchType.none);

      _repoResponse.fold((left) {
        print('left from PAi get back=========');
        // print(left.toString());

        // drugGroups = left;
        returnVal = left;
      }, (right) {
        print('right=======');
        returnVal = [];
      });
      return returnVal;
    } catch (err) {
      print('Error connectiing to server ' + err.toString());
      rethrow;
    }
  }

  set setDrugroups(List<DrugGroup> drugroups) => this.drugroups = drugroups;
}
