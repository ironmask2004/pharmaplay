import 'package:dartz/dartz.dart' as dartz;
import 'package:user_repository/src/api/user_api.dart';
import 'package:user_repository/user_repository.dart';

class UserRepository {
  UserRepository(this.baseUrl);
  User? _user; //= User.empty;
  final String baseUrl;

  /*Future<User?> getUser1(String tokenId, String baseUrl) async {
    /* print('GetUser1111: - "${_user.id}" - ');
    if (_user.id != '') return _user;
    print('GetUser222:' + user_id);
*/
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => _user = await getUserByTokenId(tokenId,   baseUrl), //user_id),
    );
  }*/

  Future<dartz.Either<User, ApiError>> getUserById(
      {required String tokenId}) async {
    dartz.Either<ApiResponse, ApiError> _getUserResponse;

    try {
      _getUserResponse = await apiGetUserByTokenId(tokenId, baseUrl);
      print('login response :' + _getUserResponse.toString());

      return _getUserResponse.fold((left) {
        //print((right as ApiError).error.toString());
        print('left1');
        print((left.Data as Map<String, dynamic>).toString());
        User _userInfo = User.fromMap(left.Data as Map<String, dynamic>);
        print(_userInfo.toJson().toString());
        print('left2');
        //_controller.add(AuthRepoState.authenticated(_tokenPair));

        return dartz.left(_userInfo);
      }, (right) {
        // _controller.add(AuthRepoState.unauthenticated(TokenPair.empty()));
        print('right');
        print(right.toJson().toString());
        return dartz.right(right as ApiError);
      });
    } catch (err) {
      print('Error connectiing to server ' + err.toString());
      throw (err);
      // return dartz.right(ApiError(error: '$err', errorNo: '1900202'));
    }
  }
}
