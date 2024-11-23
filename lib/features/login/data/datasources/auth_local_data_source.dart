import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shora/core/utils/constants/app_strings.dart';

import '../models/user_model.dart';

abstract class AuthLocalDataSource {
  const AuthLocalDataSource();
  Future<int> saveUser(UserModel user);
  Future<void> saveToken(String token);
  UserModel? getCurrentUser();
  Future<void> logOut();
}

class AuthLocalDataSourceImp extends AuthLocalDataSource {
  const AuthLocalDataSourceImp(this._userBox, this._storage);
  final Box<Map> _userBox;
  final FlutterSecureStorage _storage;

  @override
  Future<int> saveUser(UserModel user) async {
    await _userBox.clear();

    return _userBox.add(user.toMap());
  }

  @override
  Future<void> saveToken(String token) {
    return _storage.write(key: AppString.kTokenKey, value: token);
  }

  @override
  UserModel? getCurrentUser() {
    final Map? map = _userBox.values.lastOrNull;
    if (map == null) return null;
    return UserModel.fromMap(map);
  }

  @override
  Future<void> logOut() async {
    Future.wait(
      [
        _storage.deleteAll(),
        _userBox.clear(),
      ],
    );
  }
}
