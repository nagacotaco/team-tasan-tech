import 'package:get_it/get_it.dart';
import 'package:team_tasan_tech/features/chat/domain/use_cases/chat_gpt_use_case.dart';
import 'package:team_tasan_tech/features/chat/infrastructure/chat_gpt_repository.dart';

import 'features/auth/domain/use_cases/auth_use_case.dart';
import 'features/auth/infrastructure/firebase/fireauth_repository.dart';
import 'features/user/domain/use_case/user_model_use_case.dart';
import 'features/user/infrastructure/repository/user_model_repository.dart';

final injector = GetIt.instance;

void initSingletons() {
  injector.registerSingleton<AuthUseCase>(
    AuthUseCase(FireAuthRepository()),
  );
  injector.registerSingleton<UserModelUseCase>(
    UserModelUseCase(FirestoreUserModelRepo()),
  );
  injector.registerSingleton<ChatGptUseCase>(
    ChatGptUseCase(ChatGptRepository()),
  );
}
