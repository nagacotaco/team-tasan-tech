import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_tasan_tech/features/home/presentation/widgets/bottom_sheet_menu.dart';
import 'package:team_tasan_tech/features/home/presentation/widgets/scene_chip.dart';

import '../../application/page_model/home_page_model.dart';
import '../../application/provider/home_page_notifier.dart';
import '../../../../shared/widgets/app_bottom_sheet.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_divider.dart';

import '../../../../main.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homePageState = ref.watch(homePageStateProvider);
    final homePageStateNotifier = ref.watch(homePageStateProvider.notifier);
    final TestLevel testLevel = homePageState.level;
    final String appBarTitle;

    switch (testLevel) {
      case TestLevel.beginner:
        appBarTitle = '初級モード';
      case TestLevel.standard:
        appBarTitle = '中級モード';
      case TestLevel.advanced:
        appBarTitle = '上級モード';
    }

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              floating: false,
              toolbarHeight: $styles.dimens.appBarHeight,
              title: Text(appBarTitle),
              actions: [
                TextButton(
                  onPressed: () {
                    AppBottomSheet().showAppBottomSheet(
                      context: context,
                      physics: const NeverScrollableScrollPhysics(),
                      // showDrugHandle: true,
                      showCloseButton: true,
                      child: Padding(
                        padding: EdgeInsets.all($styles.insets.p16),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '会話設定',
                                style: $styles.text.headlineMedium.copyWith(
                                    color: $styles.colors.textColors.primary),
                              ),
                              SizedBox(height: $styles.insets.p12),
                              BottomSheetMenu<TestMode>(
                                title: '特定のトピックで練習',
                                subtitle: 'シーンを選んで特定のトピックで会話を練習する。',
                                value: TestMode.specificTopic,
                                onTap: (newValue) {
                                  homePageStateNotifier
                                      .updateTestMode(newValue);
                                },
                              ),
                              const AppDivider(),
                              BottomSheetMenu<TestMode>(
                                title: '自由なトピックで会話する',
                                subtitle: 'テーマを自由に設定し、会話を始めます。',
                                value: TestMode.freeTopic,
                                onTap: (newValue) {
                                  homePageStateNotifier
                                      .updateTestMode(newValue);
                                },
                              ),
                              SizedBox(height: $styles.insets.p8),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      homePageState.testMode == TestMode.specificTopic
                          ? Text(
                              'カテゴリー会話',
                              style: $styles.text.labelMedium.copyWith(
                                  color:
                                      $styles.colors.functionalColors.action),
                            )
                          : Text(
                              '自由会話',
                              style: $styles.text.labelMedium.copyWith(
                                  color:
                                      $styles.colors.functionalColors.action),
                            ),
                      Icon(Icons.keyboard_arrow_down_rounded,
                          size: 16,
                          color: $styles.colors.functionalColors.action),
                    ],
                  ),
                ),
              ],
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: $styles.insets.p24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: $styles.insets.p28),
                    Text(
                      'こんにちは永田さん👋',
                      style: $styles.text.headlineMedium,
                    ),
                    SizedBox(height: $styles.insets.p4),
                    Text(
                      '今日は何の話をしましょうか？',
                      style: $styles.text.titleMediumBold
                          .copyWith(color: $styles.colors.textColors.tertiary),
                    ),
                    SizedBox(height: $styles.insets.p40),
                    // * モード切り替え
                    homePageState.testMode == TestMode.freeTopic
                        ? TextFormField(
                            decoration: InputDecoration(
                              hintText: '例）入国審査の会話',
                              hintStyle: $styles.text.titleMediumBold.copyWith(
                                  color:
                                      $styles.colors.functionalColors.inactive),
                            ),
                          )
                        : Wrap(
                            runSpacing: $styles.insets.p8,
                            spacing: $styles.insets.p8,
                            children: [
                              SceneChip(
                                onTap: () {},
                                title: Text(
                                  'ニューヨークのホテルで 🏨',
                                  style: $styles.text.labelMediumBold,
                                ),
                              ),
                              SceneChip(
                                onTap: () {},
                                title: Text(
                                  '金曜の夜 👯‍♀',
                                  style: $styles.text.labelMediumBold,
                                ),
                              ),
                              SceneChip(
                                onTap: () {},
                                title: Text(
                                  '美術館で 🎨',
                                  style: $styles.text.labelMediumBold,
                                ),
                              ),
                              SceneChip(
                                onTap: () {},
                                title: Text(
                                  '英語で採用面接に挑戦 👔',
                                  style: $styles.text.labelMediumBold,
                                ),
                              ),
                              SceneChip(
                                onTap: () {},
                                title: Text(
                                  '自己紹介の実践 🦄',
                                  style: $styles.text.labelMediumBold,
                                ),
                              ),
                              SceneChip(
                                onTap: () {},
                                title: Text(
                                  '友達に電話で今週末の予定を尋ねる 🫶',
                                  style: $styles.text.labelMediumBold,
                                ),
                              ),
                            ],
                          ),
                    SizedBox(height: $styles.insets.p8),
                    const Spacer(),
                    homePageState.testMode == TestMode.freeTopic
                        ? AppButton.solid(
                            label: '会話を始める',
                            onTap: () {},
                          )
                        : const SizedBox.shrink(),
                    SizedBox(height: $styles.insets.p16),
                    AppButton.solid(
                      backgroundColor: $styles.colors.keyColor.tertiary,
                      labelColor: $styles.colors.keyColor.primary,
                      label: 'レベル変更',
                      onTap: () {
                        AppBottomSheet().showAppBottomSheet(
                          context: context,
                          physics: const NeverScrollableScrollPhysics(),
                          // showDrugHandle: true,
                          showCloseButton: true,
                          child: Padding(
                            padding: EdgeInsets.all($styles.insets.p16),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'レベル設定',
                                    style: $styles.text.headlineMedium.copyWith(
                                      color: $styles.colors.textColors.primary,
                                    ),
                                  ),
                                  SizedBox(height: $styles.insets.p2),
                                  Text(
                                    'AIのテストレベルを選択',
                                    style: $styles.text.bodySmall,
                                  ),
                                  SizedBox(height: $styles.insets.p12),
                                  BottomSheetMenu<TestLevel>(
                                    title: '初級レベル',
                                    value: TestLevel.beginner,
                                    onTap: (newValue) {
                                      homePageStateNotifier
                                          .updateLevel(newValue);
                                    },
                                  ),
                                  const AppDivider(),
                                  BottomSheetMenu<TestLevel>(
                                    title: '中級レベル',
                                    value: TestLevel.standard,
                                    onTap: (newValue) {
                                      homePageStateNotifier
                                          .updateLevel(newValue);
                                    },
                                  ),
                                  const AppDivider(),
                                  BottomSheetMenu<TestLevel>(
                                    title: '上級レベル',
                                    value: TestLevel.advanced,
                                    onTap: (newValue) {
                                      homePageStateNotifier
                                          .updateLevel(newValue);
                                    },
                                  ),
                                  const AppDivider(),
                                  SizedBox(height: $styles.insets.p8),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: $styles.insets.p24),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
