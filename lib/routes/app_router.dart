import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:team_tasan_tech/features/auth/presentation/views/create_account_page.dart';
import 'package:team_tasan_tech/features/samples/app_bar_sample/app_bar_sample.dart';
import 'package:team_tasan_tech/features/samples/list_tile_sample/list_tile_sample.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/account/presentation/account_page.dart';
import '../features/auth/presentation/views/login_page.dart';
import '../features/home/presentation/screens/bottom_navigation_page_controller.dart';
import '../features/samples/dialog_sample/dialog_sample.dart';
import '../features/samples/snack_bar_sample/snack_bar_sample.dart';
import '../features/samples/text_field/text_field_sample.dart';
import '../features/samples/text_sample/text_sample_page.dart';

part 'app_router.g.dart';

enum Routes {
  home,
  login,
  account,
  textSample,
  dialogSample,
  snackBarSample,
  textFieldSample,
  listTileSample,
  appBarSample,
  createAccount,
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: false,
    routes: [
      GoRoute(
        path: '/',
        name: Routes.home.name,
        builder: (context, state) => BottomNavigationPageController(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: '/login',
        name: Routes.login.name,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/account',
        name: Routes.account.name,
        builder: (context, state) => const AccountPage(),
      ),
      GoRoute(
        path: '/textSample',
        name: Routes.textSample.name,
        builder: (context, state) => const TextSamplePage(),
      ),
      GoRoute(
        path: '/dialogSample',
        name: Routes.dialogSample.name,
        builder: (context, state) => const DialogSamplePage(),
      ),
      GoRoute(
        path: '/snackBarSample',
        name: Routes.snackBarSample.name,
        builder: (context, state) => const SnackBarSamplePage(),
      ),
      GoRoute(
        path: '/textFieldSample',
        name: Routes.textFieldSample.name,
        builder: (context, state) => const TextFieldSamplePage(),
      ),
      GoRoute(
        path: '/listTileSample',
        name: Routes.listTileSample.name,
        builder: (context, state) => const ListTileSample(),
      ),
      GoRoute(
        path: '/appBarSample',
        name: Routes.appBarSample.name,
        builder: (context, state) => const AppBarSample(),
      ),
      GoRoute(
        path: '/createAccount',
        name: Routes.createAccount.name,
        builder: (context, state) => const CreateAccountPage(),
      ),
    ],
    redirect: (context, state) async {
      if (FirebaseAuth.instance.currentUser == null &&
          state.fullPath != '/createAccount') {
        return '/login';
      }
      // ログインしているのに、ログインページにいる場合はホームにいく
      if (state.fullPath == '/login') {
        return '/';
      }
      // リダイレクトが不要な場合
      return null;
    },
  );
}
