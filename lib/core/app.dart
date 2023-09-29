import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/auth/application/providers/state/auth_notifier.dart';
import '../main.dart';

import '../app/app_strings.dart';
import '../routes/app_router.dart';
import '../shared/widgets/app_style_base.dart';

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    ref.read(firebaseAuthNotifierProvider);
    return MaterialApp.router(
      title: AppStrings.appName,
      theme: ThemeData(
          fontFamily: $styles.text.bodyMedium.fontFamily, useMaterial3: true),
      routerDelegate: goRouter.routerDelegate,
      routeInformationParser: goRouter.routeInformationParser,
      routeInformationProvider: goRouter.routeInformationProvider,
      debugShowCheckedModeBanner: false,
      builder: (context, child) => AppStyleBase(child: child!),
    );
  }
}
