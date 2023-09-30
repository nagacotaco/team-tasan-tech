// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_page_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HomePageModel _$HomePageModelFromJson(Map<String, dynamic> json) {
  return _HomePageModel.fromJson(json);
}

/// @nodoc
mixin _$HomePageModel {
  String get username => throw _privateConstructorUsedError;
  TestLevel get level => throw _privateConstructorUsedError;
  Themes? get currentTopic => throw _privateConstructorUsedError;
  TestMode get testMode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomePageModelCopyWith<HomePageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageModelCopyWith<$Res> {
  factory $HomePageModelCopyWith(
          HomePageModel value, $Res Function(HomePageModel) then) =
      _$HomePageModelCopyWithImpl<$Res, HomePageModel>;
  @useResult
  $Res call(
      {String username,
      TestLevel level,
      Themes? currentTopic,
      TestMode testMode});
}

/// @nodoc
class _$HomePageModelCopyWithImpl<$Res, $Val extends HomePageModel>
    implements $HomePageModelCopyWith<$Res> {
  _$HomePageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? level = null,
    Object? currentTopic = freezed,
    Object? testMode = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as TestLevel,
      currentTopic: freezed == currentTopic
          ? _value.currentTopic
          : currentTopic // ignore: cast_nullable_to_non_nullable
              as Themes?,
      testMode: null == testMode
          ? _value.testMode
          : testMode // ignore: cast_nullable_to_non_nullable
              as TestMode,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomePageModelImplCopyWith<$Res>
    implements $HomePageModelCopyWith<$Res> {
  factory _$$HomePageModelImplCopyWith(
          _$HomePageModelImpl value, $Res Function(_$HomePageModelImpl) then) =
      __$$HomePageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String username,
      TestLevel level,
      Themes? currentTopic,
      TestMode testMode});
}

/// @nodoc
class __$$HomePageModelImplCopyWithImpl<$Res>
    extends _$HomePageModelCopyWithImpl<$Res, _$HomePageModelImpl>
    implements _$$HomePageModelImplCopyWith<$Res> {
  __$$HomePageModelImplCopyWithImpl(
      _$HomePageModelImpl _value, $Res Function(_$HomePageModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? level = null,
    Object? currentTopic = freezed,
    Object? testMode = null,
  }) {
    return _then(_$HomePageModelImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as TestLevel,
      currentTopic: freezed == currentTopic
          ? _value.currentTopic
          : currentTopic // ignore: cast_nullable_to_non_nullable
              as Themes?,
      testMode: null == testMode
          ? _value.testMode
          : testMode // ignore: cast_nullable_to_non_nullable
              as TestMode,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomePageModelImpl implements _HomePageModel {
  const _$HomePageModelImpl(
      {this.username = '',
      this.level = TestLevel.beginner,
      this.currentTopic,
      this.testMode = TestMode.specificTopic});

  factory _$HomePageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomePageModelImplFromJson(json);

  @override
  @JsonKey()
  final String username;
  @override
  @JsonKey()
  final TestLevel level;
  @override
  final Themes? currentTopic;
  @override
  @JsonKey()
  final TestMode testMode;

  @override
  String toString() {
    return 'HomePageModel(username: $username, level: $level, currentTopic: $currentTopic, testMode: $testMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomePageModelImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.currentTopic, currentTopic) ||
                other.currentTopic == currentTopic) &&
            (identical(other.testMode, testMode) ||
                other.testMode == testMode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, username, level, currentTopic, testMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomePageModelImplCopyWith<_$HomePageModelImpl> get copyWith =>
      __$$HomePageModelImplCopyWithImpl<_$HomePageModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomePageModelImplToJson(
      this,
    );
  }
}

abstract class _HomePageModel implements HomePageModel {
  const factory _HomePageModel(
      {final String username,
      final TestLevel level,
      final Themes? currentTopic,
      final TestMode testMode}) = _$HomePageModelImpl;

  factory _HomePageModel.fromJson(Map<String, dynamic> json) =
      _$HomePageModelImpl.fromJson;

  @override
  String get username;
  @override
  TestLevel get level;
  @override
  Themes? get currentTopic;
  @override
  TestMode get testMode;
  @override
  @JsonKey(ignore: true)
  _$$HomePageModelImplCopyWith<_$HomePageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
