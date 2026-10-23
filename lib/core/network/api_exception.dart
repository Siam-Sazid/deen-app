import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

/// A failed API call, normalised from the backend's error envelope:
///
/// ```json
/// {"status": "Bad Request", "code": 400,
///  "error": {"code": "VALIDATION_ERROR", "message": "...", "fields": {...}}}
/// ```
///
/// Branch on [code] (e.g. `SOCIAL_ACCOUNT_EXISTS`), never on [message].
class ApiException extends Equatable implements Exception {
  const ApiException({
    required this.code,
    required this.message,
    this.statusCode,
    this.fields = const {},
  });

  factory ApiException.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.transformTimeout:
        return const ApiException(
          code: timeout,
          message: 'The request timed out. Please try again.',
        );
      case DioExceptionType.connectionError:
        return const ApiException(
          code: network,
          message: 'No internet connection.',
        );
      case DioExceptionType.cancel:
        return const ApiException(
          code: cancelled,
          message: 'Request cancelled.',
        );
      case DioExceptionType.badCertificate:
      case DioExceptionType.badResponse:
      case DioExceptionType.unknown:
        return ApiException.fromResponse(e.response);
    }
  }

  factory ApiException.fromResponse(Response<dynamic>? response) {
    final body = response?.data;
    final error = body is Map<String, dynamic> ? body['error'] : null;
    if (error is! Map<String, dynamic>) {
      return ApiException(
        code: unknown,
        message: 'Something went wrong. Please try again.',
        statusCode: response?.statusCode,
      );
    }
    return ApiException(
      code: error['code'] as String? ?? unknown,
      message:
          error['message'] as String? ??
          'Something went wrong. Please try again.',
      statusCode: response?.statusCode,
      fields: _parseFields(error['fields']),
    );
  }

  // Client-side codes; server codes come straight from the response.
  static const String network = 'NETWORK_ERROR';
  static const String timeout = 'TIMEOUT';
  static const String cancelled = 'CANCELLED';
  static const String unknown = 'UNKNOWN_ERROR';

  final String code;
  final String message;
  final int? statusCode;

  /// Per-field validation messages, keyed by request field name.
  final Map<String, List<String>> fields;

  bool get isUnauthenticated => statusCode == 401;
  bool get isNetwork => code == network || code == timeout;

  /// First validation message for [field], for showing under a form input.
  String? fieldError(String field) => fields[field]?.firstOrNull;

  static Map<String, List<String>> _parseFields(Object? raw) {
    if (raw is! Map) return const {};
    return {
      for (final entry in raw.entries)
        entry.key.toString(): switch (entry.value) {
          final List<dynamic> list => list.map((e) => e.toString()).toList(),
          final Object value => [value.toString()],
          null => const [],
        },
    };
  }

  @override
  List<Object?> get props => [code, message, statusCode, fields];

  @override
  String toString() => 'ApiException($statusCode $code: $message)';
}
