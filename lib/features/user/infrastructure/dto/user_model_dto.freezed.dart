// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModelDto _$UserModelDtoFromJson(Map<String, dynamic> json) {
  return _UserModelDto.fromJson(json);
}

/// @nodoc
mixin _$UserModelDto {
  @JsonKey(includeToJson: false)
  String get docId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelDtoCopyWith<UserModelDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelDtoCopyWith<$Res> {
  factory $UserModelDtoCopyWith(
          UserModelDto value, $Res Function(UserModelDto) then) =
      _$UserModelDtoCopyWithImpl<$Res, UserModelDto>;
  @useResult
  $Res call({@JsonKey(includeToJson: false) String docId, String name});
}

/// @nodoc
class _$UserModelDtoCopyWithImpl<$Res, $Val extends UserModelDto>
    implements $UserModelDtoCopyWith<$Res> {
  _$UserModelDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? docId = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      docId: null == docId
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelDtoImplCopyWith<$Res>
    implements $UserModelDtoCopyWith<$Res> {
  factory _$$UserModelDtoImplCopyWith(
          _$UserModelDtoImpl value, $Res Function(_$UserModelDtoImpl) then) =
      __$$UserModelDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(includeToJson: false) String docId, String name});
}

/// @nodoc
class __$$UserModelDtoImplCopyWithImpl<$Res>
    extends _$UserModelDtoCopyWithImpl<$Res, _$UserModelDtoImpl>
    implements _$$UserModelDtoImplCopyWith<$Res> {
  __$$UserModelDtoImplCopyWithImpl(
      _$UserModelDtoImpl _value, $Res Function(_$UserModelDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? docId = null,
    Object? name = null,
  }) {
    return _then(_$UserModelDtoImpl(
      docId: null == docId
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelDtoImpl extends _UserModelDto {
  const _$UserModelDtoImpl(
      {@JsonKey(includeToJson: false) this.docId = '', this.name = ''})
      : super._();

  factory _$UserModelDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelDtoImplFromJson(json);

  @override
  @JsonKey(includeToJson: false)
  final String docId;
  @override
  @JsonKey()
  final String name;

  @override
  String toString() {
    return 'UserModelDto(docId: $docId, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelDtoImpl &&
            (identical(other.docId, docId) || other.docId == docId) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, docId, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelDtoImplCopyWith<_$UserModelDtoImpl> get copyWith =>
      __$$UserModelDtoImplCopyWithImpl<_$UserModelDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelDtoImplToJson(
      this,
    );
  }
}

abstract class _UserModelDto extends UserModelDto {
  const factory _UserModelDto(
      {@JsonKey(includeToJson: false) final String docId,
      final String name}) = _$UserModelDtoImpl;
  const _UserModelDto._() : super._();

  factory _UserModelDto.fromJson(Map<String, dynamic> json) =
      _$UserModelDtoImpl.fromJson;

  @override
  @JsonKey(includeToJson: false)
  String get docId;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$UserModelDtoImplCopyWith<_$UserModelDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
