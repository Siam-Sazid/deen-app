import 'dart:async';

/// Broadcasts when the session can no longer be refreshed, so the auth
/// feature can send the user back to login from anywhere in the app.
class SessionEvents {
  final StreamController<void> _expired = StreamController<void>.broadcast();

  Stream<void> get onExpired => _expired.stream;

  void notifyExpired() => _expired.add(null);

  Future<void> dispose() => _expired.close();
}
