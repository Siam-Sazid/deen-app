import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';
import 'app/di/injection.dart';
import 'core/bloc/app_bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await configureDependencies();
  Bloc.observer = const AppBlocObserver();
  runApp(const DeenApp());
}
