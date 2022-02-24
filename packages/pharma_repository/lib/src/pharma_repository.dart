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
      {required String localUI}) async {
    dartz.Either<ApiResponse, ApiError> _getDrugGroupAllResponse;

    try {
      _getDrugGroupAllResponse = await apiGetDrugGroupAll(localUI, baseUrl);
      print('DrugGroup response :' + _getDrugGroupAllResponse.toString());

      return _getDrugGroupAllResponse.fold((left) {
        //print((right as ApiError).error.toString());
        print('left1');
        print(left.Data);

        print('left2');
        //_controller.add(AuthRepoState.authenticated(_tokenPair));

        return dartz.left(List<DrugGroup>.from((left.Data as List<DrugGroup>)));
      }, (right) {
        // _controller.add(AuthRepoState.unauthenticated(TokenPair.empty()));
        print('right');
        print(right.toJson().toString());
        return dartz.right(right);
      });
    } catch (err) {
      print('Error connectiing to server ' + err.toString());
      throw (err);
      // return dartz.right(ApiError(error: '$err', errorNo: '1900202'));
    }
  }
}
