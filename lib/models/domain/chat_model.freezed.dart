// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) {
  return _ChatModel.fromJson(json);
}

/// @nodoc
mixin _$ChatModel {
  String get docId => throw _privateConstructorUsedError;
  String get theme => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;
  List<ChatGptConversationModel> get conversationList =>
      throw _privateConstructorUsedError;
  List<String> get reviweList => throw _privateConstructorUsedError;
  bool get canContinue => throw _privateConstructorUsedError;
  bool get isStartFromUser => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  DateTime? get day => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatModelCopyWith<ChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatModelCopyWith<$Res> {
  factory $ChatModelCopyWith(ChatModel value, $Res Function(ChatModel) then) =
      _$ChatModelCopyWithImpl<$Res, ChatModel>;
  @useResult
  $Res call(
      {String docId,
      String theme,
      int score,
      List<ChatGptConversationModel> conversationList,
      List<String> reviweList,
      bool canContinue,
      bool isStartFromUser,
      bool isLoading,
      DateTime? day});
}

/// @nodoc
class _$ChatModelCopyWithImpl<$Res, $Val extends ChatModel>
    implements $ChatModelCopyWith<$Res> {
  _$ChatModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? docId = null,
    Object? theme = null,
    Object? score = null,
    Object? conversationList = null,
    Object? reviweList = null,
    Object? canContinue = null,
    Object? isStartFromUser = null,
    Object? isLoading = null,
    Object? day = freezed,
  }) {
    return _then(_value.copyWith(
      docId: null == docId
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      conversationList: null == conversationList
          ? _value.conversationList
          : conversationList // ignore: cast_nullable_to_non_nullable
              as List<ChatGptConversationModel>,
      reviweList: null == reviweList
          ? _value.reviweList
          : reviweList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      canContinue: null == canContinue
          ? _value.canContinue
          : canContinue // ignore: cast_nullable_to_non_nullable
              as bool,
      isStartFromUser: null == isStartFromUser
          ? _value.isStartFromUser
          : isStartFromUser // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatModelImplCopyWith<$Res>
    implements $ChatModelCopyWith<$Res> {
  factory _$$ChatModelImplCopyWith(
          _$ChatModelImpl value, $Res Function(_$ChatModelImpl) then) =
      __$$ChatModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String docId,
      String theme,
      int score,
      List<ChatGptConversationModel> conversationList,
      List<String> reviweList,
      bool canContinue,
      bool isStartFromUser,
      bool isLoading,
      DateTime? day});
}

/// @nodoc
class __$$ChatModelImplCopyWithImpl<$Res>
    extends _$ChatModelCopyWithImpl<$Res, _$ChatModelImpl>
    implements _$$ChatModelImplCopyWith<$Res> {
  __$$ChatModelImplCopyWithImpl(
      _$ChatModelImpl _value, $Res Function(_$ChatModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? docId = null,
    Object? theme = null,
    Object? score = null,
    Object? conversationList = null,
    Object? reviweList = null,
    Object? canContinue = null,
    Object? isStartFromUser = null,
    Object? isLoading = null,
    Object? day = freezed,
  }) {
    return _then(_$ChatModelImpl(
      docId: null == docId
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      conversationList: null == conversationList
          ? _value._conversationList
          : conversationList // ignore: cast_nullable_to_non_nullable
              as List<ChatGptConversationModel>,
      reviweList: null == reviweList
          ? _value._reviweList
          : reviweList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      canContinue: null == canContinue
          ? _value.canContinue
          : canContinue // ignore: cast_nullable_to_non_nullable
              as bool,
      isStartFromUser: null == isStartFromUser
          ? _value.isStartFromUser
          : isStartFromUser // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatModelImpl extends _ChatModel {
  const _$ChatModelImpl(
      {this.docId = '',
      this.theme = '',
      this.score = 0,
      final List<ChatGptConversationModel> conversationList = const [],
      final List<String> reviweList = const [],
      this.canContinue = true,
      this.isStartFromUser = false,
      this.isLoading = false,
      this.day})
      : _conversationList = conversationList,
        _reviweList = reviweList,
        super._();

  factory _$ChatModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatModelImplFromJson(json);

  @override
  @JsonKey()
  final String docId;
  @override
  @JsonKey()
  final String theme;
  @override
  @JsonKey()
  final int score;
  final List<ChatGptConversationModel> _conversationList;
  @override
  @JsonKey()
  List<ChatGptConversationModel> get conversationList {
    if (_conversationList is EqualUnmodifiableListView)
      return _conversationList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conversationList);
  }

  final List<String> _reviweList;
  @override
  @JsonKey()
  List<String> get reviweList {
    if (_reviweList is EqualUnmodifiableListView) return _reviweList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviweList);
  }

  @override
  @JsonKey()
  final bool canContinue;
  @override
  @JsonKey()
  final bool isStartFromUser;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final DateTime? day;

  @override
  String toString() {
    return 'ChatModel(docId: $docId, theme: $theme, score: $score, conversationList: $conversationList, reviweList: $reviweList, canContinue: $canContinue, isStartFromUser: $isStartFromUser, isLoading: $isLoading, day: $day)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatModelImpl &&
            (identical(other.docId, docId) || other.docId == docId) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.score, score) || other.score == score) &&
            const DeepCollectionEquality()
                .equals(other._conversationList, _conversationList) &&
            const DeepCollectionEquality()
                .equals(other._reviweList, _reviweList) &&
            (identical(other.canContinue, canContinue) ||
                other.canContinue == canContinue) &&
            (identical(other.isStartFromUser, isStartFromUser) ||
                other.isStartFromUser == isStartFromUser) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.day, day) || other.day == day));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      docId,
      theme,
      score,
      const DeepCollectionEquality().hash(_conversationList),
      const DeepCollectionEquality().hash(_reviweList),
      canContinue,
      isStartFromUser,
      isLoading,
      day);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatModelImplCopyWith<_$ChatModelImpl> get copyWith =>
      __$$ChatModelImplCopyWithImpl<_$ChatModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatModelImplToJson(
      this,
    );
  }
}

abstract class _ChatModel extends ChatModel {
  const factory _ChatModel(
      {final String docId,
      final String theme,
      final int score,
      final List<ChatGptConversationModel> conversationList,
      final List<String> reviweList,
      final bool canContinue,
      final bool isStartFromUser,
      final bool isLoading,
      final DateTime? day}) = _$ChatModelImpl;
  const _ChatModel._() : super._();

  factory _ChatModel.fromJson(Map<String, dynamic> json) =
      _$ChatModelImpl.fromJson;

  @override
  String get docId;
  @override
  String get theme;
  @override
  int get score;
  @override
  List<ChatGptConversationModel> get conversationList;
  @override
  List<String> get reviweList;
  @override
  bool get canContinue;
  @override
  bool get isStartFromUser;
  @override
  bool get isLoading;
  @override
  DateTime? get day;
  @override
  @JsonKey(ignore: true)
  _$$ChatModelImplCopyWith<_$ChatModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
