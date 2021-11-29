import 'dart:async';
//import 'package:uuid/uuid.dart';
import 'models/models.dart';

class UserRepository {
  User00 _user = User00.empty;

  Future<User00?> getUser(String user_id) async {
    /* print('GetUser1111: - "${_user.id}" - ');
    if (_user.id != '') return _user;
    print('GetUser222:' + user_id);
*/
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => _user = User00('00000000000000000000000000'), //user_id),
    );
  }
}
