// ignore_for_file: invalid_annotation_target

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../models/domain/user_model.dart';

part 'user_model_dto.freezed.dart';
part 'user_model_dto.g.dart';

@freezed
class UserModelDto with _$UserModelDto {
  const UserModelDto._();
  const factory UserModelDto({
    @JsonKey(includeToJson: false) @Default('') String docId,
    @Default('') String name,
  }) = _UserModelDto;
  factory UserModelDto.fromJson(Map<String, dynamic> json) =>
      _$UserModelDtoFromJson(json);

  static const collectionPath = 'user';

  factory UserModelDto.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    var json = Map<String, dynamic>.from(snapshot.data()!);
    json['docId'] = snapshot.id;
    return UserModelDto.fromJson(json);
  }

  factory UserModelDto.fromEntity(UserModel model) {
    return UserModelDto(
      docId: model.uid,
      name: model.name,
    );
  }

  UserModel toEntity() {
    return UserModel(
      uid: docId,
      name: name,
    );
  }
}
