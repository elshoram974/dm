import 'dart:developer';

import 'package:shora/app_info.dart';
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
      AppLinks.login,
      {
        "phone": AppInfo.isDebugMode ? '+2001210119384' : phone,
        "password": AppInfo.isDebugMode ? 'Rep@2468' : password,
      },
    );
    final String token = res['token'];
    log(res.toString());

    return (
      user: UserModel(name: "name", email: "email"), //TODO:* Remove this
      token: token,
    );
  }
}
