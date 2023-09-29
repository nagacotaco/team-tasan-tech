import 'package:team_tasan_tech/features/auth/application/providers/state/auth_notifier.dart';
import 'package:team_tasan_tech/injector.dart';
import 'package:team_tasan_tech/models/domain/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/use_case/user_model_use_case.dart';

part 'user_model_notifier.g.dart';

@Riverpod(keepAlive: true)
class UserModelNotifier extends _$UserModelNotifier {
  final UserModelUseCase _userModelUseCase = injector<UserModelUseCase>();
  @override
  Future<UserModel> build() {
    final user = ref.watch(firebaseAuthNotifierProvider);
    return _userModelUseCase.getByUid(user!.uid);
  }
}
