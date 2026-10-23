import 'package:dio/dio.dart';

import 'api_exception.dart';

/// Thin wrapper over [Dio] used by every remote data source.
///
/// It unwraps the backend's success envelope (`{"status", "code", "data"}`)
/// so callers receive `data` directly, and converts every failure into an
/// [ApiException].
class ApiClient {
  ApiClient(this._dio);

  final Dio _dio;

  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? query,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _send(
      () => _dio.get<dynamic>(
        path,
        queryParameters: query,
        options: options,
        cancelToken: cancelToken,
      ),
    );
  }

  Future<T> post<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? query,
    Options? options,
  }) {
    return _send(
      () => _dio.post<dynamic>(
        path,
        data: data,
        queryParameters: query,
        options: options,
      ),
    );
  }

  Future<T> put<T>(String path, {Object? data, Options? options}) {
    return _send(() => _dio.put<dynamic>(path, data: data, options: options));
  }

  Future<T> patch<T>(String path, {Object? data, Options? options}) {
    return _send(() => _dio.patch<dynamic>(path, data: data, options: options));
  }

  /// Deletes usually answer 204 with no body, so nothing is returned.
  Future<void> delete(String path, {Object? data, Options? options}) {
    return _send<dynamic>(
      () => _dio.delete<dynamic>(path, data: data, options: options),
    );
  }

  Future<T> _send<T>(Future<Response<dynamic>> Function() request) async {
    try {
      final response = await request();
      final body = response.data;
      if (body is Map<String, dynamic> && body.containsKey('data')) {
        return body['data'] as T;
      }
      return body as T;
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
