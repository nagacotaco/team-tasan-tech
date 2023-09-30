// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_gpt_respons_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatGptResponseModel _$ChatGptResponseModelFromJson(Map<String, dynamic> json) {
  return _ChatGptResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ChatGptResponseModel {
  String get correct => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  String get res => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatGptResponseModelCopyWith<ChatGptResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatGptResponseModelCopyWith<$Res> {
  factory $ChatGptResponseModelCopyWith(ChatGptResponseModel value,
          $Res Function(ChatGptResponseModel) then) =
      _$ChatGptResponseModelCopyWithImpl<$Res, ChatGptResponseModel>;
  @useResult
  $Res call({String correct, String reason, String res, int score});
}

/// @nodoc
class _$ChatGptResponseModelCopyWithImpl<$Res,
        $Val extends ChatGptResponseModel>
    implements $ChatGptResponseModelCopyWith<$Res> {
  _$ChatGptResponseModelCopyWithImpl(this._value, this._then);

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
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatGptResponseModelImplCopyWith<$Res>
    implements $ChatGptResponseModelCopyWith<$Res> {
  factory _$$ChatGptResponseModelImplCopyWith(_$ChatGptResponseModelImpl value,
          $Res Function(_$ChatGptResponseModelImpl) then) =
      __$$ChatGptResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String correct, String reason, String res, int score});
}

/// @nodoc
class __$$ChatGptResponseModelImplCopyWithImpl<$Res>
    extends _$ChatGptResponseModelCopyWithImpl<$Res, _$ChatGptResponseModelImpl>
    implements _$$ChatGptResponseModelImplCopyWith<$Res> {
  __$$ChatGptResponseModelImplCopyWithImpl(_$ChatGptResponseModelImpl _value,
      $Res Function(_$ChatGptResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? correct = null,
    Object? reason = null,
    Object? res = null,
    Object? score = null,
  }) {
    return _then(_$ChatGptResponseModelImpl(
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
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatGptResponseModelImpl extends _ChatGptResponseModel {
  const _$ChatGptResponseModelImpl(
      {this.correct = '', this.reason = '', this.res = '', this.score = 0})
      : super._();

  factory _$ChatGptResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatGptResponseModelImplFromJson(json);

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
  final int score;

  @override
  String toString() {
    return 'ChatGptResponseModel(correct: $correct, reason: $reason, res: $res, score: $score)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatGptResponseModelImpl &&
            (identical(other.correct, correct) || other.correct == correct) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.res, res) || other.res == res) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, correct, reason, res, score);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatGptResponseModelImplCopyWith<_$ChatGptResponseModelImpl>
      get copyWith =>
          __$$ChatGptResponseModelImplCopyWithImpl<_$ChatGptResponseModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatGptResponseModelImplToJson(
      this,
    );
  }
}

abstract class _ChatGptResponseModel extends ChatGptResponseModel {
  const factory _ChatGptResponseModel(
      {final String correct,
      final String reason,
      final String res,
      final int score}) = _$ChatGptResponseModelImpl;
  const _ChatGptResponseModel._() : super._();

  factory _ChatGptResponseModel.fromJson(Map<String, dynamic> json) =
      _$ChatGptResponseModelImpl.fromJson;

  @override
  String get correct;
  @override
  String get reason;
  @override
  String get res;
  @override
  int get score;
  @override
  @JsonKey(ignore: true)
  _$$ChatGptResponseModelImplCopyWith<_$ChatGptResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
