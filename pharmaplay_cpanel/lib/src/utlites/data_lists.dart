import 'package:pharma_repository/pharma_repository.dart';
import 'package:dartz/dartz.dart' as dartz;

class DataLists {
  late List<DrugGroup> drugroups;
  late List<DrugGroup> drugroupsString;
  late final PharmaRepository _pharmaRepository;

  DataLists({
    required PharmaRepository pharmaRepository,
  }) : _pharmaRepository = pharmaRepository;

  Future<List<String>> get getDrugroupsString async {
    var ee = await getDrugroups;
    return ee.map((e) => e.toString()).toList();
  }

  Future<List<DrugGroup>> get getDrugroups async {
    final dartz.Either<List<DrugGroup>, ApiError> _repoResponse;
    try {
      //TokenPair _tokenInfo;
      _repoResponse = await _pharmaRepository.getDrugGroupsSearch(
          startFromPage: "1",
          pageLength: '100000',
          orderByFields: '',
          localeUI: 'en', //state.localeUI,
          whereCond: '', //event.whereCond ?? '',
          serachValue: '', // event.serachValue ?? '',
          searchType: SearchType.none);

      _repoResponse.fold((left) {
        print('left from PAi get back');
        print(left.toString());

        // drugGroups = left;
        return left;
      }, (right) {
        print('right');
        return [];
      });
    } catch (err) {
      print('Error connectiing to server ' + err.toString());
      rethrow;
    }

    return [];
  }

  set setDrugroups(List<DrugGroup> drugroups) => this.drugroups = drugroups;
}
