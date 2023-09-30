// 状態として HomePageModel クラスのインスタンスを持つ
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_tasan_tech/features/chat/application/providers/level_provider.dart';
import 'package:team_tasan_tech/features/chat/application/providers/theme_provider.dart';
import 'package:team_tasan_tech/features/home/application/page_model/home_page_model.dart';
import 'package:team_tasan_tech/features/home/domain/enum/themes.dart';

class HomePageStateNotifier extends StateNotifier<HomePageModel> {
  HomePageStateNotifier(this.ref) : super(const HomePageModel());
  final themeInputController = TextEditingController();
  Ref ref;

  @override
  void dispose() {
    themeInputController.dispose();
    super.dispose();
  }

  void updateCurrentTopic(Themes newTopic) {
    state = state.copyWith(currentTopic: newTopic);
  }

  void updateLevel(TestLevel newLevel) {
    state = state.copyWith(level: newLevel);
  }

  void updateTestMode(TestMode selection) {
    state = state.copyWith(testMode: selection);
  }

  void settingConversation() {
    ref.read(themeProvider.notifier).state =
        state.testMode == TestMode.freeTopic
            ? themeInputController.text
            : state.currentTopic!.keyStringEn;
    ref.read(levelProvider.notifier).state = state.level.keyString;
  }
}

final homePageStateProvider =
    StateNotifierProvider<HomePageStateNotifier, HomePageModel>(
  (ref) => HomePageStateNotifier(ref),
);
