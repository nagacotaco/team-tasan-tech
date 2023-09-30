import 'package:team_tasan_tech/models/domain/chat_gpt_respons_model.dart';

abstract class ChatGptRepo {
  Future<ChatGptResponseModel> sendMessage(String message);
}
