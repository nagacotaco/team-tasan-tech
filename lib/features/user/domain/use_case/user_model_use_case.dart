import 'package:team_tasan_tech/models/domain/user_model.dart';

import '../repository/user_model_repository.dart';

class UserModelUseCase {
  final UserModelRepository userModelRepository;

  UserModelUseCase(this.userModelRepository);

  Future<void> create(UserModel userModel) async {
    await userModelRepository.create(userModel);
  }

  Future<void> delete(String uid) async {
    await userModelRepository.delete(uid);
  }

  Future<UserModel> getByUid(String uid) async {
    return await userModelRepository.getByUid(uid);
  }

  Future<void> update(UserModel userModel) async {
    await userModelRepository.update(userModel);
  }
}
