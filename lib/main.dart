import 'package:dart_openai/dart_openai.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app_styles.dart';
import 'core/app.dart';
import 'core/observers.dart';
import 'firebase_options.dart';
import 'injector.dart';
import 'shared/widgets/app_style_base.dart';

void main() => runMain();

Future<void> runMain() async {
  WidgetsFlutterBinding.ensureInitialized();
  initSingletons();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Setting Device Orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  OpenAI.apiKey = const String.fromEnvironment('API_KEY');

  runApp(ProviderScope(observers: [Observers()], child: const MainApp()));
}

AppStyle get $styles => AppStyleBase.style;
