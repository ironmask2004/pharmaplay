import 'package:dartz/dartz.dart' as dartz;
import 'package:pharma_repository/src/api/pharma_api.dart';
import 'package:pharma_repository/pharma_repository.dart';
import 'api/api_response.dart';

class PharmaRepository {
  PharmaRepository(this.baseUrl);
  //drugGroup? _drugGroup; //= drugGroup.empty;
  final String baseUrl;

  Future<dartz.Either<List<DrugRecord>, ApiError>> getDrugsSearch(
      {String? startFromPage,
      String? pageLength,
      String? orderByFields,
      String? localUI,
      String? whereCond,
      String? serachValue,
      SearchType? searchType}) async {
    String _whereCond = '';
    String _fuzzycond = '';
    dartz.Either<ApiResponse, ApiError> _getDrugRecoredAllResponse;

    try {
//like, equal, fuzzy, none
      switch (searchType) {
        case SearchType.none:
          {
            _whereCond = '';
          }
          break;
        case SearchType.equal:
          {
            _whereCond =
                ''' "wherecond":  " Where    drug.\\"ar__brandName\\" = '${serachValue}'  OR  lower ( drug.\\"en__brandName\\") =  lower ('${serachValue}')"  ''';
          }
          break;
        case SearchType.like:
          {
            _whereCond =
                ''' "wherecond":  " Where    drug.\\"ar__brandName\\" like '%${serachValue}%'  OR  lower ( drug.\\"en__brandName\\") LIKE  lower ('%${serachValue}%')"  ''';
          }
          break;
        case SearchType.fuzzy:
          {
            _whereCond = '';
            _fuzzycond = ''' "fuzzycond":  "\\"$serachValue\\"" ''';
          }

          break;
        default:
          {
            _whereCond = '';
          }
      }

      _getDrugRecoredAllResponse = await apiGetDrugsSearch(
          localUI: localUI,
          startFromPage: startFromPage,
          pageLength: pageLength,
          orderByFields: orderByFields,
          whereCond: _whereCond,
          fuzzyCond: _fuzzycond,
          baseUrl: baseUrl);

      return _getDrugRecoredAllResponse.fold((left) {
        //_controller.add(AuthRepoState.authenticated(_tokenPair));

        var DrugRecoredList =
            ((left.Data) as List).map((i) => DrugRecord.fromJson(i)).toList();

        return dartz.left(DrugRecoredList);
      }, (right) {
        // _controller.add(AuthRepoState.unauthenticated(TokenPair.empty()));
        return dartz.right(right);
      });
    } catch (err) {
      throw (err);
      // return dartz.right(ApiError(error: '$err', errorNo: '1900202'));
    }
  }

//===========================

  Future<dartz.Either<List<DrugGroup>, ApiError>> getDrugGroupsSearch(
      {String? startFromPage,
      String? pageLength,
      String? orderByFields,
      String? localUI,
      String? whereCond,
      String? serachValue,
      SearchType? searchType}) async {
    String _whereCond = '';
    String _fuzzycond = '';
    dartz.Either<ApiResponse, ApiError> _getDrugGroupAllResponse;

    try {
//like, equal, fuzzy, none
      switch (searchType) {
        case SearchType.none:
          {
            _whereCond = '';
          }
          break;
        case SearchType.equal:
          {
            _whereCond =
                ''' "wherecond":  " Where    druggroup.\\"ar__drugGroupName\\" = '${serachValue}'  OR  lower ( druggroup.\\"en__drugGroupName\\") =  lower ('${serachValue}')"  ''';
          }
          break;
        case SearchType.like:
          {
            _whereCond =
                ''' "wherecond":  " Where    druggroup.\\"ar__drugGroupName\\" like '%${serachValue}%'  OR  lower ( druggroup.\\"en__drugGroupName\\") LIKE  lower ('%${serachValue}%')"  ''';
          }
          break;
        case SearchType.fuzzy:
          {
            _whereCond = '';
            _fuzzycond = ''' "fuzzycond":  "\\"$serachValue\\"" ''';
          }

          break;
        default:
          {
            _whereCond = '';
          }
      }

      _getDrugGroupAllResponse = await apiGetDrugGroupsSearch(
          localUI: localUI,
          startFromPage: startFromPage,
          pageLength: pageLength,
          orderByFields: orderByFields,
          whereCond: _whereCond,
          fuzzyCond: _fuzzycond,
          baseUrl: baseUrl);

      return _getDrugGroupAllResponse.fold((left) {
        var DrugGroupList =
            ((left.Data) as List).map((i) => DrugGroup.fromJson(i)).toList();

        return dartz.left(DrugGroupList);
      }, (right) {
        return dartz.right(right);
      });
    } catch (err) {
      throw (err);
      // return dartz.right(ApiError(error: '$err', errorNo: '1900202'));
    }
  }
}
