import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_gpt_conversation_model.freezed.dart';
part 'chat_gpt_conversation_model.g.dart';

@freezed
class ChatGptConversationModel with _$ChatGptConversationModel {
  const ChatGptConversationModel._();
  const factory ChatGptConversationModel({
    @Default('') String correct,
    @Default('') String reason,
    @Default('') String res,
    @Default('') String role,
    @Default(0) int score,
  }) = _ChatGptConversationModel;
  factory ChatGptConversationModel.fromJson(Map<String, dynamic> json) =>
      _$ChatGptConversationModelFromJson(json);
}
