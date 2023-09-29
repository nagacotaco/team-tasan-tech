import 'package:firebase_auth/firebase_auth.dart';
import 'package:team_tasan_tech/models/domain/user_model.dart';

import '../repositories/auth_repository.dart';

class AuthUseCase {
  final AuthRepository authRepository;

  AuthUseCase(this.authRepository);

  Future<void> signInWithEmailAndPassword(
      {required mail, required String password}) async {
    await authRepository.signInWithEmailAndPassword(mail, password);
  }

  User? getCurrentUser() {
    return authRepository.getCurrentUser();
  }

  Future<void> signOut() async {
    await authRepository.signOut();
  }

  Future<UserModel> createUserWithEmailAndPassword(
      String email, String password) async {
    return await authRepository.createUserWithEmailAndPassword(email, password);
  }
}
