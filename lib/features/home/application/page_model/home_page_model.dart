// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:team_tasan_tech/features/chat/application/providers/level_provider.dart';
import 'package:team_tasan_tech/features/home/domain/enum/themes.dart';

// 生成されるdartファイルを記述
part 'home_page_model.freezed.dart';
part 'home_page_model.g.dart';

//生成コードを実行//
//flutter pub run build_runner watch --delete-conflicting-outputs//

enum TestMode { freeTopic, specificTopic }

@freezed
abstract class HomePageModel with _$HomePageModel {
  const factory HomePageModel({
    @Default('') String username,
    @Default(TestLevel.beginner) TestLevel level,
    Themes? currentTopic,
    @Default(TestMode.specificTopic) TestMode testMode,
  }) = _HomePageModel;

  // json形式で受け取るためのコードを生成するために記述
  factory HomePageModel.fromJson(Map<String, dynamic> json) =>
      _$HomePageModelFromJson(json);
}
