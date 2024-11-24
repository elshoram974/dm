import 'package:shora/core/utils/constants/app_links.dart';
import 'package:shora/core/utils/services/api_services.dart';

import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  const AuthRemoteDataSource();
  Future<({UserModel user, String token})> login({
    required String phone,
    required String password,
  });
}

class AuthRemoteDataSourceImp extends AuthRemoteDataSource {
  const AuthRemoteDataSourceImp(this.apiServices);
  final APIServices apiServices;

  @override
  Future<({UserModel user, String token})> login({
    required String phone,
    required String password,
  }) async {
    final Map<String, dynamic> res = await apiServices.post(
      '$AppLinks.login',
      {
        "phone": phone,
        "password": password,
      },
    );
    final String token = res['token'];

    return (
      user: UserModel.fromMap(res..remove('token')),
      token: token,
    );
  }
}
