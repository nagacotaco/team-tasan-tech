import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../injector.dart';
import '../../../../../models/domain/user_model.dart';
import '../../../../user/domain/use_case/user_model_use_case.dart';
import '../../../domain/use_cases/auth_use_case.dart';

part 'auth_notifier.g.dart';

@Riverpod(keepAlive: true)
class FirebaseAuthNotifier extends _$FirebaseAuthNotifier {
  final AuthUseCase _authUseCase = injector<AuthUseCase>();
  @override
  User? build() {
    return _authUseCase.getCurrentUser();
  }

  Future<void> login(String mail, String password) async {
    try {
      await _authUseCase.signInWithEmailAndPassword(
        mail: mail,
        password: password,
      );
      state = _authUseCase.getCurrentUser();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await _authUseCase.signOut();
    } catch (e) {
      debugPrint('$runtimeType > サインアウトエラー');
      rethrow;
    }
  }

  Future<void> createAccount(String mail, String password) async {
    try {
      final newUser =
          await _authUseCase.createUserWithEmailAndPassword(mail, password);
      await injector<UserModelUseCase>()
          .create(UserModel(uid: newUser.uid, name: 'none'));
    } catch (e) {
      rethrow;
    }
  }
}
