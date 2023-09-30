// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_gpt_conversation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatGptConversationModelImpl _$$ChatGptConversationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatGptConversationModelImpl(
      correct: json['correct'] as String? ?? '',
      reason: json['reason'] as String? ?? '',
      res: json['res'] as String? ?? '',
      role: json['role'] as String? ?? '',
      score: json['score'] as int? ?? 0,
    );

Map<String, dynamic> _$$ChatGptConversationModelImplToJson(
        _$ChatGptConversationModelImpl instance) =>
    <String, dynamic>{
      'correct': instance.correct,
      'reason': instance.reason,
      'res': instance.res,
      'role': instance.role,
      'score': instance.score,
    };
