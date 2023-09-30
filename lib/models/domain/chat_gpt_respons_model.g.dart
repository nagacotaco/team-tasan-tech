// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_gpt_respons_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatGptResponseModelImpl _$$ChatGptResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatGptResponseModelImpl(
      correct: json['correct'] as String? ?? '',
      reason: json['reason'] as String? ?? '',
      res: json['res'] as String? ?? '',
      score: json['score'] as int? ?? 0,
    );

Map<String, dynamic> _$$ChatGptResponseModelImplToJson(
        _$ChatGptResponseModelImpl instance) =>
    <String, dynamic>{
      'correct': instance.correct,
      'reason': instance.reason,
      'res': instance.res,
      'score': instance.score,
    };
