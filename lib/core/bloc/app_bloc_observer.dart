import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Logs every state change and error in debug builds.
class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    if (kDebugMode) debugPrint('${bloc.runtimeType} $change');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    if (kDebugMode) debugPrint('${bloc.runtimeType} $error\n$stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
