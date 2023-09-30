import 'package:dart_openai/dart_openai.dart';
import 'package:team_tasan_tech/features/chat/domain/repositories/chat_gpt_repository.dart';

class ChatGptRepository implements ChatGptRepo {
  @override
  Future<OpenAIChatCompletionModel> sendMessage(
      List<OpenAIChatCompletionChoiceMessageModel> messages) async {
    return await OpenAI.instance.chat.create(
      model: 'gpt-4',
      messages: messages,
    );
  }
}
