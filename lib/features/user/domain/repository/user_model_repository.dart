import '../../../../../models/domain/user_model.dart';

abstract class UserModelRepository {
  Future<void> create(UserModel userModel);
  Future<UserModel> getByUid(String uid);
  Future<void> update(UserModel userModel);
  Future<void> delete(String uid);
}
