import 'package:dartz/dartz.dart' as dartz;
import 'package:pharma_repository/src/api/pharma_api.dart';
import 'package:pharma_repository/pharma_repository.dart';
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

  Future<dartz.Either<List<DrugRecord>, ApiError>> getDrugAll(
      {String? startFromPage,
      String? pageLength,
      String? orderByFields,
      String? localUI,
      String? whereCond}) async {
    dartz.Either<ApiResponse, ApiError> _getDrugRecoredAllResponse;

    try {
      print('localUI: $localUI');
      _getDrugRecoredAllResponse = await apiGetDrugAll(
          localUI: localUI,
          startFromPage: startFromPage,
          pageLength: pageLength,
          orderByFields: orderByFields,
          whereCond: whereCond,
          baseUrl: baseUrl);

      print('DrugRecored response :' + _getDrugRecoredAllResponse.toString());

      return _getDrugRecoredAllResponse.fold((left) {
        //print((right as ApiError).error.toString());
        print('left11 getDrugAll');
        print(left.Data);

        print('left2 getDrugAll');
        //_controller.add(AuthRepoState.authenticated(_tokenPair));

        var DrugRecoredList =
            ((left.Data) as List).map((i) => DrugRecord.fromJson(i)).toList();
        print('left233 getDrugAll');

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
