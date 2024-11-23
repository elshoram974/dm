import 'package:shora/core/status/status.dart';
import 'package:shora/core/utils/functions/execute_and_handle_remote_errors.dart';

import '../../domain/repositories/auth_repositories.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/user_model.dart';

class AuthRepositoriesImp extends AuthRepositories {
  const AuthRepositoriesImp({
    required this.localDataSource,
    required this.remoteDataSource,
  });
  final AuthLocalDataSource localDataSource;
  final AuthRemoteDataSource remoteDataSource;

  @override
  Future<Status<UserModel>> login({
    required String email,
    required String password,
  }) {
    return executeAndHandleErrors<UserModel>(
      () async {
        final ({UserModel user, String token}) res =
            await remoteDataSource.login(
          email: email,
          password: password,
        );
        await Future.wait(
          [
            localDataSource.saveUser(res.user),
            localDataSource.saveToken(res.token),
          ],
        );
        return res.user;
      },
    );
  }
}
