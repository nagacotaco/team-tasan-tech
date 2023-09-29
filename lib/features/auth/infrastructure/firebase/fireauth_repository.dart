import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:team_tasan_tech/models/domain/user_model.dart';

import '../../../../app/app_strings.dart';
import '../../domain/repositories/auth_repository.dart';

class FireAuthRepository implements AuthRepository {
  @override
  Future<UserModel> createUserWithEmailAndPassword(
      String mail, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: mail, password: password);
      debugPrint('$runtimeType > $credential');
      return UserModel(uid: credential.user!.uid);
    } on FirebaseAuthException catch (e) {
      throw convertAuthError(e);
    }
  }

  @override
  Future<void> deleteUser() async {
    try {
      await FirebaseAuth.instance.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      throw convertAuthError(e);
    }
  }

  @override
  Future<void> sendPasswordResetEmail() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: FirebaseAuth.instance.currentUser!.email!,
      );
    } on FirebaseAuthException catch (e) {
      throw convertAuthError(e);
    }
  }

  @override
  Future<void> signInWithEmailAndPassword(String mail, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: mail, password: password);
    } on FirebaseAuthException catch (e) {
      throw convertAuthError(e);
    }
  }

  @override
  Future<void> updatePassword(String newPassword) async {
    try {
      await FirebaseAuth.instance.currentUser!.updatePassword(newPassword);
    } on FirebaseAuthException catch (e) {
      throw convertAuthError(e);
    }
  }

  @override
  User? getCurrentUser() {
    return FirebaseAuth.instance.currentUser;
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}

/// FirebaseAuth のエラーコードからエラー文言を返す（https://firebase.google.com/docs/auth/admin/errors?hl=ja）
String convertAuthError(FirebaseAuthException e) {
  debugPrint('$e');
  switch (e.code) {
    case 'invalid-email':
      return FirebaseAuthErrorStrings.inputError;
    case 'wrong-password':
      return FirebaseAuthErrorStrings.inputError;
    case 'user-not-found':
      return FirebaseAuthErrorStrings.inputError;
    case 'weak-password':
      return '';
    // case 'user-disabled':
    //   return '';
    case 'email-already-in-use':
      return FirebaseAuthErrorStrings.emailAlreadyInUse;
    case 'expired-action-code':
      return FirebaseAuthErrorStrings.expiredActionCode;
    case 'too-many-requests':
      return FirebaseAuthErrorStrings.tooManyRequests;
    default:
      return FirebaseAuthErrorStrings.unexpectedErrors;
  }
}
