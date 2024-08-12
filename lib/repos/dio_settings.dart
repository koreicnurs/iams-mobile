import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DioSettings {
  DioSettings() {
    unawaited(setup());
  }

  final Dio dio = Dio(BaseOptions(
    baseUrl: 'https://mes-mobile.yorc.org/api/',
    contentType: "application/json",
    headers: {"Accept": "application/json"},
    connectTimeout: const Duration(seconds: 20),
    receiveTimeout: const Duration(seconds: 20),
  ));

  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  Future<void> setup() async {
    final Interceptors interceptors = dio.interceptors;

    interceptors.clear();

    final LogInterceptor logInterceptor =
        LogInterceptor(requestBody: true, responseBody: true);

    final QueuedInterceptorsWrapper headerInterceptors =
        QueuedInterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {
        final token = await secureStorage.read(key: 'token');
        if (token != null) {
          options.headers['x-access-token'] = token;
        }
        handler.next(options);
      },
      onError: (DioException error, ErrorInterceptorHandler handler) =>
          handler.next(error),
      onResponse: (Response response, ResponseInterceptorHandler handler) =>
          handler.next(response),
    );
    interceptors.addAll([if (kDebugMode) logInterceptor, headerInterceptors]);
  }
}
