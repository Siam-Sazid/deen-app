import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../config/app_config.dart';
import '../storage/token_storage.dart';
import 'auth_interceptor.dart';
import 'session_events.dart';

abstract final class DioFactory {
  static Dio create({
    required TokenStorage tokenStorage,
    required SessionEvents sessionEvents,
  }) {
    final options = BaseOptions(
      baseUrl: AppConfig.baseUrl,
      connectTimeout: AppConfig.connectTimeout,
      receiveTimeout: AppConfig.receiveTimeout,
      contentType: Headers.jsonContentType,
      headers: {'Accept': 'application/json'},
    );

    // Separate instance without the auth interceptor, used for the refresh
    // call and for replaying the original request, to avoid recursion.
    final refreshDio = Dio(options);

    final dio = Dio(options)
      ..interceptors.add(
        AuthInterceptor(
          tokenStorage: tokenStorage,
          refreshDio: refreshDio,
          sessionEvents: sessionEvents,
        ),
      );

    if (kDebugMode) {
      final logger = LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (line) => debugPrint(line.toString()),
      );
      dio.interceptors.add(logger);
      refreshDio.interceptors.add(logger);
    }
    return dio;
  }
}
