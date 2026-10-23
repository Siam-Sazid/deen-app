/// Build-time configuration.
///
/// Override the base URL per build with
/// `flutter run --dart-define=API_BASE_URL=https://example.com/api/v1`.
abstract final class AppConfig {
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://test.deenstep.com/api/v1',
  );

  static const Duration connectTimeout = Duration(seconds: 20);
  static const Duration receiveTimeout = Duration(seconds: 30);
}
