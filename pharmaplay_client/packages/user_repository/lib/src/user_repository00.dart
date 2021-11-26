import 'dart:async';
import 'package:uuid/uuid.dart';
import 'models/models.dart';

class UserRepository {
  User00? _user;

  Future<User00?> getUser() async {
    if (_user != null) return _user;
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => _user = User00(const Uuid().v4()),
    );
  }
}
