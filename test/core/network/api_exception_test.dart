import 'package:deen_app/core/network/api_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final request = RequestOptions(path: '/auth/login/');

  Response<dynamic> response(int status, Object? body) =>
      Response(requestOptions: request, statusCode: status, data: body);

  group('ApiException.fromResponse', () {
    test('parses the error envelope with field errors', () {
      final e = ApiException.fromResponse(
        response(400, {
          'status': 'Bad Request',
          'code': 400,
          'error': {
            'code': 'VALIDATION_ERROR',
            'message': 'Validation failed.',
            'fields': {
              'email': ['This field is required.'],
            },
          },
        }),
      );

      expect(e.code, 'VALIDATION_ERROR');
      expect(e.statusCode, 400);
      expect(e.fieldError('email'), 'This field is required.');
      expect(e.fieldError('password'), isNull);
    });

    test('keeps server error codes for branching', () {
      final e = ApiException.fromResponse(
        response(409, {
          'error': {'code': 'SOCIAL_ACCOUNT_EXISTS', 'message': 'Exists.'},
        }),
      );

      expect(e.code, 'SOCIAL_ACCOUNT_EXISTS');
    });

    test('falls back to unknown for a non-envelope body', () {
      final e = ApiException.fromResponse(response(502, '<html>'));

      expect(e.code, ApiException.unknown);
      expect(e.statusCode, 502);
    });
  });

  test('connection errors map to the network code', () {
    final e = ApiException.fromDioException(
      DioException.connectionError(requestOptions: request, reason: 'offline'),
    );

    expect(e.code, ApiException.network);
    expect(e.isNetwork, isTrue);
  });
}
