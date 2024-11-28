import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shora/app_info.dart';

import '../constants/app_strings.dart';

class APIServices {
  const APIServices(this._dio, this._storage);
  final Dio _dio;
  final FlutterSecureStorage _storage;

  Future<Map<String, dynamic>> post(
    final String link,
    final Object? body,
  ) async {
    final String? token = await _getAuthToken;

    final Response response = await _dio.post(
      link,
      data: body,
      queryParameters: token != null ? {"token": token} : null,
      options: Options(headers: {'content-type': "application/json"}),
    );

    if (response.data is! Map<String, dynamic>) {
      return {"response": response.data};
    }

    if (response.data!['is_success'] == false) {
      throw response.data!['message'];
    }

    return response.data!;
  }

  Future<Map<String, dynamic>> get(final String link) async {
    final String? token = await _getAuthToken;

    if (AppInfo.isDebugMode) {
      print("api $link");
      print("user token is $token ");
    }

    final Response<Map<String, dynamic>> response = await _dio.get(
      link,
      queryParameters: token != null ? {"token": token} : null,
      options: Options(headers: {'content-type': "application/json"}),
    );

    if (response.data!['is_success'] == false) {
      throw response.data!['message'];
    }

    return response.data!; // ['data']; return all response data
  }

  Future<String?> get _getAuthToken => _storage.read(key: AppString.kTokenKey);
}
