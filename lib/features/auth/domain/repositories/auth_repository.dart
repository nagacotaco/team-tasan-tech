import 'package:firebase_auth/firebase_auth.dart';
import 'package:team_tasan_tech/models/domain/user_model.dart';

abstract class AuthRepository {
  User? getCurrentUser();
  Future<void> signInWithEmailAndPassword(String mail, String password);
  Future<UserModel> createUserWithEmailAndPassword(
      String mail, String password);
  Future<void> updatePassword(String newPassword);
  Future<void> sendPasswordResetEmail();
  Future<void> deleteUser();
  Future<void> signOut();
}
