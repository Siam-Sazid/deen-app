import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/network/api_client.dart';
import '../../core/network/dio_factory.dart';
import '../../core/network/session_events.dart';
import '../../core/storage/token_storage.dart';

/// Service locator. Only the app layer and feature `di` files touch it;
/// widgets receive their Cubits through `BlocProvider`.
final GetIt sl = GetIt.instance;

Future<void> configureDependencies() async {
  final prefs = await SharedPreferences.getInstance();

  sl
    ..registerSingleton<SharedPreferences>(prefs)
    ..registerLazySingleton<FlutterSecureStorage>(
      () => const FlutterSecureStorage(),
    )
    ..registerLazySingleton<TokenStorage>(() => TokenStorage(sl()))
    ..registerLazySingleton<SessionEvents>(SessionEvents.new)
    ..registerLazySingleton<Dio>(
      () => DioFactory.create(tokenStorage: sl(), sessionEvents: sl()),
    )
    ..registerLazySingleton<ApiClient>(() => ApiClient(sl()));

  // Each feature registers its own data sources, repositories and Cubits
  // from `features/<name>/di/<name>_di.dart`, e.g.:
  // registerAuthDependencies(sl);
}
