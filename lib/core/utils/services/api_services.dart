import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../constants/app_strings.dart';

class APIServices {
  const APIServices(this._dio, this._storage);
  final Dio _dio;
  final FlutterSecureStorage _storage;

  Future<Map<String, dynamic>> post(
    final String link,
    final Map<String, String?> body,
  ) async {
    final Map<String, dynamic> header = {};
    final String? token = await _getAuthToken;
    if (token != null) {
      header['Authorization'] = 'Bearer $token';
    }

    Response<Map<String, dynamic>> response = await _dio.post(
      link,
      data: body,
      options: Options(headers: header),
    );

    if (response.data!['is_success'] == false) {
      throw response.data!['message'];
    }

    return response.data!['data'];
  }

  Future<String?> get _getAuthToken => _storage.read(key: AppString.kTokenKey);
}
