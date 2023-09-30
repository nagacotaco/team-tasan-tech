import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:team_tasan_tech/models/domain/chat_gpt_respons_model.dart';

part 'chat_model.freezed.dart';
part 'chat_model.g.dart';

@freezed
class ChatModel with _$ChatModel {
  const ChatModel._();
  const factory ChatModel({
    @Default('') String docId,
    @Default('') String theme,
    @Default(0) int score,
    @Default([]) List<String> userCommentList,
    @Default([]) List<ChatGptResponseModel> chatGptResList,
    @Default([]) List<String> reviweList,
    @Default(true) bool canContinue,
    @Default(false) bool isStartFromUser,
    @Default(false) bool isLoading,
    DateTime? day,
  }) = _ChatModel;
  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);
}
