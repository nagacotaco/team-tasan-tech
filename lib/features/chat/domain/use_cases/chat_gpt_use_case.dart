import 'package:team_tasan_tech/features/chat/domain/repositories/chat_gpt_repository.dart';
import 'package:team_tasan_tech/models/domain/chat_gpt_respons_model.dart';

class ChatGptUseCase {
  final ChatGptRepo chatGptRepo;

  ChatGptUseCase(this.chatGptRepo);

  Future<ChatGptResponseModel> sendMessage(String message) async {
    return await chatGptRepo.sendMessage(message);
  }
}
