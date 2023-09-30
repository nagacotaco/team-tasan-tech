import 'package:dart_openai/dart_openai.dart';
import 'package:team_tasan_tech/features/chat/domain/repositories/chat_gpt_repository.dart';

class ChatGptUseCase {
  final ChatGptRepo chatGptRepo;

  ChatGptUseCase(this.chatGptRepo);

  Future<OpenAIChatCompletionModel> sendMessage(
      List<OpenAIChatCompletionChoiceMessageModel> messages) async {
    return await chatGptRepo.sendMessage(messages);
  }
}
