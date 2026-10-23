import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Persists the JWT pair in the Android Keystore-backed secure storage.
///
/// Tokens are cached in memory after the first read so the auth interceptor
/// does not hit the platform channel on every request.
class TokenStorage {
  TokenStorage(this._storage);

  final FlutterSecureStorage _storage;

  static const String _accessKey = 'access_token';
  static const String _refreshKey = 'refresh_token';

  String? _access;
  String? _refresh;
  bool _loaded = false;

  Future<String?> get accessToken async {
    await _ensureLoaded();
    return _access;
  }

  Future<String?> get refreshToken async {
    await _ensureLoaded();
    return _refresh;
  }

  Future<bool> get hasSession async => (await refreshToken) != null;

  Future<void> saveTokens({
    required String access,
    required String refresh,
  }) async {
    _access = access;
    _refresh = refresh;
    _loaded = true;
    await Future.wait([
      _storage.write(key: _accessKey, value: access),
      _storage.write(key: _refreshKey, value: refresh),
    ]);
  }

  Future<void> saveAccessToken(String access) async {
    _access = access;
    await _storage.write(key: _accessKey, value: access);
  }

  Future<void> clear() async {
    _access = null;
    _refresh = null;
    _loaded = true;
    await Future.wait([
      _storage.delete(key: _accessKey),
      _storage.delete(key: _refreshKey),
    ]);
  }

  Future<void> _ensureLoaded() async {
    if (_loaded) return;
    _access = await _storage.read(key: _accessKey);
    _refresh = await _storage.read(key: _refreshKey);
    _loaded = true;
  }
}
