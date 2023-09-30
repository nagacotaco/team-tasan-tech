import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_gpt_respons_model.freezed.dart';
part 'chat_gpt_respons_model.g.dart';

@freezed
class ChatGptResponseModel with _$ChatGptResponseModel {
  const ChatGptResponseModel._();
  const factory ChatGptResponseModel({
    @Default('') String correct,
    @Default('') String reason,
    @Default('') String res,
    @Default(0) int score,
  }) = _ChatGptResponseModel;
  factory ChatGptResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ChatGptResponseModelFromJson(json);
}
