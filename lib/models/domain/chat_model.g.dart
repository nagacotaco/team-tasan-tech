// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatModelImpl _$$ChatModelImplFromJson(Map<String, dynamic> json) =>
    _$ChatModelImpl(
      docId: json['docId'] as String? ?? '',
      theme: json['theme'] as String? ?? '',
      score: json['score'] as int? ?? 0,
      conversationList: (json['conversationList'] as List<dynamic>?)
              ?.map((e) =>
                  ChatGptConversationModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      reviweList: (json['reviweList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      canContinue: json['canContinue'] as bool? ?? true,
      isStartFromUser: json['isStartFromUser'] as bool? ?? false,
      isLoading: json['isLoading'] as bool? ?? false,
      day: json['day'] == null ? null : DateTime.parse(json['day'] as String),
    );

Map<String, dynamic> _$$ChatModelImplToJson(_$ChatModelImpl instance) =>
    <String, dynamic>{
      'docId': instance.docId,
      'theme': instance.theme,
      'score': instance.score,
      'conversationList': instance.conversationList,
      'reviweList': instance.reviweList,
      'canContinue': instance.canContinue,
      'isStartFromUser': instance.isStartFromUser,
      'isLoading': instance.isLoading,
      'day': instance.day?.toIso8601String(),
    };
