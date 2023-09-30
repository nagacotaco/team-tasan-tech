import 'package:dart_openai/dart_openai.dart';

abstract class ChatGptRepo {
  Future<OpenAIChatCompletionModel> sendMessage(
    List<OpenAIChatCompletionChoiceMessageModel> messages,
  );
}
