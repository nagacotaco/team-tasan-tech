// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

// 生成されるdartファイルを記述
part 'home_page_model.freezed.dart';
part 'home_page_model.g.dart';

//生成コードを実行//
//flutter pub run build_runner watch --delete-conflicting-outputs//

enum TestMode { freeTopic, specificTopic }

enum TestLevel { beginner, standard, advanced }

@freezed
abstract class HomePageModel with _$HomePageModel {
  const factory HomePageModel({
    @Default('') String username,
    @Default(TestLevel.beginner) TestLevel level,
    @Default('') String currentTopic,
    @Default(TestMode.specificTopic) TestMode testMode,
  }) = _HomePageModel;

  // json形式で受け取るためのコードを生成するために記述
  factory HomePageModel.fromJson(Map<String, dynamic> json) =>
      _$HomePageModelFromJson(json);
}
