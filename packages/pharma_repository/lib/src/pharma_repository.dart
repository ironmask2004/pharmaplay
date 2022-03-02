import 'package:dartz/dartz.dart' as dartz;
import 'package:pharma_repository/src/api/pharma_api.dart';
import 'package:pharma_repository/pharma_repository.dart';
import 'package:pharma_repository/src/models/commaon.dart';
import 'api/api_response.dart';

class PharmaRepository {
  PharmaRepository(this.baseUrl);
  //drugGroup? _drugGroup; //= drugGroup.empty;
  final String baseUrl;

  /*Future<drugGroup?> getdrugGroup1(String tokenId, String baseUrl) async {
    /* print('GetdrugGroup1111: - "${_drugGroup.id}" - ');
    if (_drugGroup.id != '') return _drugGroup;
    print('GetdrugGroup222:' + drugGroup_id);
*/
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => _drugGroup = await getdrugGroupByTokenId(tokenId,   baseUrl), //drugGroup_id),
    );
  }*/

  Future<dartz.Either<List<DrugGroup>, ApiError>> getDrugGroupAll(
      {required String localUI, String? whereCond}) async {
    dartz.Either<ApiResponse, ApiError> _getDrugGroupAllResponse;

    try {
      whereCond = whereCond ?? '';
      print('localUI: $localUI');
      _getDrugGroupAllResponse =
          await apiGetDrugGroupAll(localUI, whereCond, baseUrl);

      print('DrugGroup response :' + _getDrugGroupAllResponse.toString());

      return _getDrugGroupAllResponse.fold((left) {
        //print((right as ApiError).error.toString());
        print('left11111111111111111');
        print(left.Data);

        print('left233333');
        //_controller.add(AuthRepoState.authenticated(_tokenPair));

        var drugGroupList =
            ((left.Data) as List).map((i) => DrugGroup.fromJson(i)).toList();
        print('left2333gggggggg33');

        return dartz.left(drugGroupList);
      }, (right) {
        // _controller.add(AuthRepoState.unauthenticated(TokenPair.empty()));
        print('right');
        print(right.toJson().toString());
        return dartz.right(right);
      });
    } catch (err) {
      print('Error ' + err.toString());
      throw (err);
      // return dartz.right(ApiError(error: '$err', errorNo: '1900202'));
    }
  }

  /*-------------
  // {String? startFromPage,
    String? pageLength,
    String? orderByFields,
    String? localUI,
    String? whereCond,
  */

  Future<dartz.Either<List<DrugRecord>, ApiError>> getDrugsSearch(
      {String? startFromPage,
      String? pageLength,
      String? orderByFields,
      String? localUI,
      String? whereCond,
      String? searcValue,
      SearchType? searchType}) async {
    String _whereCond = '';
    String _fuzzycond = '';
    dartz.Either<ApiResponse, ApiError> _getDrugRecoredAllResponse;

    try {
      print('localUI: $localUI');

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
                ''' "wherecond":  " Where    drug.\\"ar__brandName\\" = '${searcValue}'  OR  lower ( drug.\\"en__brandName\\") =  lower ('${searcValue}')"  ''';
          }
          break;
        case SearchType.like:
          {
            _whereCond =
                ''' "wherecond":  " Where    drug.\\"ar__brandName\\" like '%${searcValue}%'  OR  lower ( drug.\\"en__brandName\\") LIKE  lower ('%${searcValue}%')"  ''';
          }
          break;
        case SearchType.fuzzy:
          {
            _whereCond = '';
            _fuzzycond = ''' "fuzzycond":  "\\"$searcValue\\"" ''';
          }

          break;
        default:
          {
            _whereCond = '';
          }
      }

      print(
          '\n\n\n\n\nn\ =!=!=!=!=!=!=!=============== $searchType ====================== \nwhereCond: $_whereCond  ----  _fuzzycond:::  $_fuzzycond ');

      _getDrugRecoredAllResponse = await apiGetDrugsSearch(
          localUI: localUI,
          startFromPage: startFromPage,
          pageLength: pageLength,
          orderByFields: orderByFields,
          whereCond: _whereCond,
          fuzzyCond: _fuzzycond,
          baseUrl: baseUrl);

      print('DrugRecored response :' + _getDrugRecoredAllResponse.toString());

      return _getDrugRecoredAllResponse.fold((left) {
        //print((right as ApiError).error.toString());
        print('left11 getDrugsSearch');
        print(left.Data);

        print('left2 getDrugsSearch');
        //_controller.add(AuthRepoState.authenticated(_tokenPair));

        var DrugRecoredList =
            ((left.Data) as List).map((i) => DrugRecord.fromJson(i)).toList();
        print('left233 getDrugsSearch');

        return dartz.left(DrugRecoredList);
      }, (right) {
        // _controller.add(AuthRepoState.unauthenticated(TokenPair.empty()));
        print('right');
        print(right.toJson().toString());
        return dartz.right(right);
      });
    } catch (err) {
      print('Error ' + err.toString());
      throw (err);
      // return dartz.right(ApiError(error: '$err', errorNo: '1900202'));
    }
  }
}
