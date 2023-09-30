// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_gpt_conversation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatGptConversationModel _$ChatGptConversationModelFromJson(
    Map<String, dynamic> json) {
  return _ChatGptConversationModel.fromJson(json);
}

/// @nodoc
mixin _$ChatGptConversationModel {
  String get correct => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  String get res => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatGptConversationModelCopyWith<ChatGptConversationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatGptConversationModelCopyWith<$Res> {
  factory $ChatGptConversationModelCopyWith(ChatGptConversationModel value,
          $Res Function(ChatGptConversationModel) then) =
      _$ChatGptConversationModelCopyWithImpl<$Res, ChatGptConversationModel>;
  @useResult
  $Res call(
      {String correct, String reason, String res, String role, int score});
}

/// @nodoc
class _$ChatGptConversationModelCopyWithImpl<$Res,
        $Val extends ChatGptConversationModel>
    implements $ChatGptConversationModelCopyWith<$Res> {
  _$ChatGptConversationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? correct = null,
    Object? reason = null,
    Object? res = null,
    Object? role = null,
    Object? score = null,
  }) {
    return _then(_value.copyWith(
      correct: null == correct
          ? _value.correct
          : correct // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      res: null == res
          ? _value.res
          : res // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatGptConversationModelImplCopyWith<$Res>
    implements $ChatGptConversationModelCopyWith<$Res> {
  factory _$$ChatGptConversationModelImplCopyWith(
          _$ChatGptConversationModelImpl value,
          $Res Function(_$ChatGptConversationModelImpl) then) =
      __$$ChatGptConversationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String correct, String reason, String res, String role, int score});
}

/// @nodoc
class __$$ChatGptConversationModelImplCopyWithImpl<$Res>
    extends _$ChatGptConversationModelCopyWithImpl<$Res,
        _$ChatGptConversationModelImpl>
    implements _$$ChatGptConversationModelImplCopyWith<$Res> {
  __$$ChatGptConversationModelImplCopyWithImpl(
      _$ChatGptConversationModelImpl _value,
      $Res Function(_$ChatGptConversationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? correct = null,
    Object? reason = null,
    Object? res = null,
    Object? role = null,
    Object? score = null,
  }) {
    return _then(_$ChatGptConversationModelImpl(
      correct: null == correct
          ? _value.correct
          : correct // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      res: null == res
          ? _value.res
          : res // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatGptConversationModelImpl extends _ChatGptConversationModel {
  const _$ChatGptConversationModelImpl(
      {this.correct = '',
      this.reason = '',
      this.res = '',
      this.role = '',
      this.score = 0})
      : super._();

  factory _$ChatGptConversationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatGptConversationModelImplFromJson(json);

  @override
  @JsonKey()
  final String correct;
  @override
  @JsonKey()
  final String reason;
  @override
  @JsonKey()
  final String res;
  @override
  @JsonKey()
  final String role;
  @override
  @JsonKey()
  final int score;

  @override
  String toString() {
    return 'ChatGptConversationModel(correct: $correct, reason: $reason, res: $res, role: $role, score: $score)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatGptConversationModelImpl &&
            (identical(other.correct, correct) || other.correct == correct) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.res, res) || other.res == res) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, correct, reason, res, role, score);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatGptConversationModelImplCopyWith<_$ChatGptConversationModelImpl>
      get copyWith => __$$ChatGptConversationModelImplCopyWithImpl<
          _$ChatGptConversationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatGptConversationModelImplToJson(
      this,
    );
  }
}

abstract class _ChatGptConversationModel extends ChatGptConversationModel {
  const factory _ChatGptConversationModel(
      {final String correct,
      final String reason,
      final String res,
      final String role,
      final int score}) = _$ChatGptConversationModelImpl;
  const _ChatGptConversationModel._() : super._();

  factory _ChatGptConversationModel.fromJson(Map<String, dynamic> json) =
      _$ChatGptConversationModelImpl.fromJson;

  @override
  String get correct;
  @override
  String get reason;
  @override
  String get res;
  @override
  String get role;
  @override
  int get score;
  @override
  @JsonKey(ignore: true)
  _$$ChatGptConversationModelImplCopyWith<_$ChatGptConversationModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
