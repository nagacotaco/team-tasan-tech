// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomePageModelImpl _$$HomePageModelImplFromJson(Map<String, dynamic> json) =>
    _$HomePageModelImpl(
      username: json['username'] as String? ?? '',
      level: $enumDecodeNullable(_$TestLevelEnumMap, json['level']) ??
          TestLevel.beginner,
      currentTopic: $enumDecodeNullable(_$ThemesEnumMap, json['currentTopic']),
      testMode: $enumDecodeNullable(_$TestModeEnumMap, json['testMode']) ??
          TestMode.specificTopic,
    );

Map<String, dynamic> _$$HomePageModelImplToJson(_$HomePageModelImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'level': _$TestLevelEnumMap[instance.level]!,
      'currentTopic': _$ThemesEnumMap[instance.currentTopic],
      'testMode': _$TestModeEnumMap[instance.testMode]!,
    };

const _$TestLevelEnumMap = {
  TestLevel.beginner: 'beginner',
  TestLevel.standard: 'standard',
  TestLevel.advanced: 'advanced',
};

const _$ThemesEnumMap = {
  Themes.shibuya: 'shibuya',
  Themes.weekend: 'weekend',
  Themes.phone: 'phone',
  Themes.friend: 'friend',
  Themes.hackathon: 'hackathon',
};

const _$TestModeEnumMap = {
  TestMode.freeTopic: 'freeTopic',
  TestMode.specificTopic: 'specificTopic',
};
