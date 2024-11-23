import 'package:shora/core/status/status.dart';

import '../../data/models/user_model.dart';

abstract class AuthRepositories {
  const AuthRepositories();

  Future<Status<UserModel>> login({
    required String email,
    required String password,
  });
}
