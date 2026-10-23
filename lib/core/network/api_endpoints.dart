/// Endpoints the core layer itself depends on.
///
/// Feature-specific endpoints live in each feature's `data/` layer so a
/// feature can be read (and reviewed) without jumping into core.
abstract final class ApiEndpoints {
  static const String refreshToken = '/auth/refresh-token/';
}
