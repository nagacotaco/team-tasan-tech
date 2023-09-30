// 状態として HomePageModel クラスのインスタンスを持つ
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_tasan_tech/features/home/application/page_model/home_page_model.dart';

class HomePageStateNotifier extends StateNotifier<HomePageModel> {
  HomePageStateNotifier() : super(const HomePageModel());

  void updateCurrentTopic(String newTopic) {
    state = state.copyWith(currentTopic: newTopic);
  }

  void updateLevel(TestLevel newLevel) {
    state = state.copyWith(level: newLevel);
  }

  void updateTestMode(TestMode selection) {
    state = state.copyWith(testMode: selection);
  }
}

final homePageStateProvider =
    StateNotifierProvider<HomePageStateNotifier, HomePageModel>(
  (ref) => HomePageStateNotifier(),
);
