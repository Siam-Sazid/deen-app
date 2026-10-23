import 'package:dio/dio.dart';

import '../storage/token_storage.dart';
import 'api_endpoints.dart';
import 'session_events.dart';

/// Attaches the access token and transparently refreshes it on a 401.
///
/// Being a [QueuedInterceptor], concurrent requests that fail together wait
/// for the first refresh instead of each starting their own.
class AuthInterceptor extends QueuedInterceptor {
  AuthInterceptor({
    required TokenStorage tokenStorage,
    required Dio refreshDio,
    required SessionEvents sessionEvents,
  }) : _tokenStorage = tokenStorage,
       _refreshDio = refreshDio,
       _sessionEvents = sessionEvents;

  /// Set `Options(extra: {AuthInterceptor.skipAuth: true})` on requests that
  /// must not carry the user's JWT (e.g. the password-reset flow).
  static const String skipAuth = 'skipAuth';
  static const String _retried = 'authRetried';

  final TokenStorage _tokenStorage;
  final Dio _refreshDio;
  final SessionEvents _sessionEvents;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.extra[skipAuth] != true) {
      final token = await _tokenStorage.accessToken;
      if (token != null) options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final options = err.requestOptions;
    final canRetry =
        err.response?.statusCode == 401 &&
        options.extra[skipAuth] != true &&
        options.extra[_retried] != true &&
        await _tokenStorage.refreshToken != null;
    if (!canRetry) return handler.next(err);

    try {
      // Another queued request may already have refreshed the token.
      final usedToken = _bearer(options);
      var access = await _tokenStorage.accessToken;
      if (access == null || access == usedToken) {
        access = await _refreshAccessToken();
      }

      options
        ..headers['Authorization'] = 'Bearer $access'
        ..extra[_retried] = true;
      handler.resolve(await _refreshDio.fetch<dynamic>(options));
    } on DioException catch (e) {
      if (e.requestOptions.path == ApiEndpoints.refreshToken) {
        await _tokenStorage.clear();
        _sessionEvents.notifyExpired();
        return handler.next(err);
      }
      handler.next(e);
    }
  }

  Future<String> _refreshAccessToken() async {
    final response = await _refreshDio.post<Map<String, dynamic>>(
      ApiEndpoints.refreshToken,
      data: {'refresh_token': await _tokenStorage.refreshToken},
    );
    final data = response.data?['data'] as Map<String, dynamic>?;
    final access = data?['access'] as String?;
    if (access == null) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        message: 'Refresh response did not contain an access token.',
      );
    }
    await _tokenStorage.saveAccessToken(access);
    return access;
  }

  String? _bearer(RequestOptions options) {
    final header = options.headers['Authorization'];
    return header is String && header.startsWith('Bearer ')
        ? header.substring(7)
        : null;
  }
}
