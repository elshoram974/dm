// ! Failure --------------------------

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shora/core/utils/config/routes/routes.dart';

import '../../../features/login/data/datasources/auth_local_data_source.dart';
import '../../utils/config/locale/generated/l10n.dart';
import 'failure.dart';
import 'failure_body.dart';

class ServerFailure<T> extends Failure<T> {
  const ServerFailure(super.failure);
  factory ServerFailure.fromDioException(DioException e) {
    final FailureBody res = FailureBody(dioExceptionType: e.type);

    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
          res.copyWith(
            code: 408,
            type: 'connection-timeout',
            message: S.current.serverTookTooLongToRespond,
          ),
        );

      case DioExceptionType.badCertificate:
        return ServerFailure(
          res.copyWith(
            code: 403,
            type: 'certificate-error',
            message: S.current.sslCertificateNotTrusted,
          ),
        );

      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(e);
      case DioExceptionType.cancel:
        return ServerFailure(
          res.copyWith(
            code: 499,
            type: 'request-canceled',
            message: S.current.cancel,
          ),
        );

      case DioExceptionType.connectionError:
        return ServerFailure(
          res.copyWith(
            code: 503,
            type: 'connection-error',
            message: S.current.noInternetConnection,
          ),
        );

      case DioExceptionType.receiveTimeout:
        return ServerFailure(
          res.copyWith(
            code: 504,
            type: 'receive-timeout',
            message: S.current.serverTookTooLong,
          ),
        );

      case DioExceptionType.sendTimeout:
        return ServerFailure(
          res.copyWith(
            code: 504,
            type: 'send-timeout',
            message: S.current.clientTookTooLong,
          ),
        );
      default:
        log(e.message ?? '');
        return ServerFailure(
          res.copyWith(
            type: 'unknown-error',
            message: S.current.unknownErrorOccurred,
          ),
        );
    }
  }
  factory ServerFailure.fromBadResponse(DioException e) {
    final int? statusCode = e.response!.statusCode;
    print(Get.currentRoute);

    final FailureBody res = FailureBody(
      type: e.type.name,
      code: statusCode ?? -1,
      message: e.response!.data is Map
          ? (e.response!.data['errors'] as List)
              .map<String>((e) => "${e['message']} with code ${e['code']}")
              .join(", and")
          : "unKnownMessage",
      dioExceptionType: e.type,
    );

    if (statusCode == 500) {
      return ServerFailure(
        res.copyWith(message: S.current.thereIsProblemWithServerTryAgainLater),
      );
    } else if (statusCode == 401 && Get.currentRoute != AppRoute.login) {
      Get.find<AuthLocalDataSource>().logOut().then(
            (_) => Get.offAllNamed(AppRoute.login),
          );
      return ServerFailure(
        res.copyWith(message: S.current.unauthorizedError),
      );
    } else if (statusCode == 404) {
      return ServerFailure(
        res.copyWith(message: S.current.pageNotFound),
      );
    }
    return ServerFailure(res);
  }
}
