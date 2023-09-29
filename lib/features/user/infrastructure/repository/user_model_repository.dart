import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:team_tasan_tech/models/domain/user_model.dart';

import '../../domain/repository/user_model_repository.dart';
import '../dto/user_model_dto.dart';

class FirestoreUserModelRepo implements UserModelRepository {
  @override
  Future<void> create(UserModel model) async {
    try {
      await FirebaseFirestore.instance
          .collection(UserModelDto.collectionPath)
          .doc(model.uid)
          .set(UserModelDto.fromEntity(model).toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> delete(String uid) async {
    try {
      await FirebaseFirestore.instance
          .collection(UserModelDto.collectionPath)
          .doc(uid)
          .delete();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> getByUid(String uid) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection(UserModelDto.collectionPath)
          .doc(uid)
          .get();
      return UserModelDto.fromSnapshot(snapshot).toEntity();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> update(UserModel model) async {
    try {
      return await FirebaseFirestore.instance
          .collection(UserModelDto.collectionPath)
          .doc(model.uid)
          .update(UserModelDto.fromEntity(model).toJson());
    } catch (e) {
      rethrow;
    }
  }
}
