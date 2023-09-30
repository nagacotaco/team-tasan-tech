import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              floating: false,
              toolbarHeight: $styles.dimens.appBarHeight,
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
                                title: '自由なトピックで会話する',
                                subtitle: 'テーマを自由に設定し、会話を始めます。',
                                value: TestMode.freeTopic,
                                onTap: (newValue) {
                                  homePageStateNotifier
                                      .updateTestMode(newValue);
                                },
                              ),
                              const AppDivider(),
                              BottomSheetMenu<TestMode>(
                                title: '特定のトピックで練習',
                                subtitle: 'シーンを選んで特定のトピックで会話を練習する。',
                                value: TestMode.specificTopic,
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
                              '自由会話',
                              style: $styles.text.labelMedium.copyWith(
                                  color:
                                      $styles.colors.functionalColors.action),
                            )
                          : Text(
                              'カテゴリー会話',
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
                    Column(
                      children: [
                        // ここのUIを会話設定によって変更
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: '例）入国審査の会話',
                            hintStyle: $styles.text.titleMediumBold.copyWith(
                                color:
                                    $styles.colors.functionalColors.inactive),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: $styles.insets.p8),
                    Text(
                      '初級レベルでテストします🤖',
                      style: $styles.text.labelLarge.copyWith(
                        color: $styles.colors.keyColor.secondary,
                      ),
                    ),
                    const Spacer(),
                    AppButton.solid(
                      label: '会話を始める',
                      onTap: () {},
                    ),
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

class BottomSheetMenu<T> extends ConsumerWidget {
  final String title;
  final String? subtitle;
  final T value;
  final ValueChanged<T> onTap;

  const BottomSheetMenu({
    Key? key,
    required this.title,
    this.subtitle,
    required this.value,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homePageState = ref.watch(homePageStateProvider);
    final isSelected =
        (homePageState.testMode == value || homePageState.level == value);

    return Material(
      child: InkWell(
        onTap: () => onTap(value),
        child: Ink(
          decoration: BoxDecoration(
            color: $styles.colors.keyColor.transparent,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: $styles.insets.p16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: isSelected
                            ? $styles.text.titleMediumBold.copyWith(
                                color: $styles.colors.keyColor.secondary,
                              )
                            : $styles.text.bodySmall.copyWith(
                                color: $styles.colors.textColors.secondary),
                      ),
                      if (subtitle != null)
                        Text(subtitle!,
                            style: isSelected
                                ? $styles.text.bodySmall.copyWith(
                                    color: $styles.colors.keyColor.secondary)
                                : $styles.text.bodySmall.copyWith(
                                    color:
                                        $styles.colors.textColors.secondary)),
                    ],
                  ),
                ),
                Visibility(
                  visible: isSelected,
                  child: Icon(
                    Icons.check_rounded,
                    size: 32,
                    color: $styles.colors.functionalColors.success,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SceneChip extends StatelessWidget {
  final Widget title;
  const SceneChip({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: $styles.insets.p10,
        vertical: $styles.insets.p12,
      ),
      decoration: BoxDecoration(
          color: $styles.colors.backgroundColors.accent,
          borderRadius: BorderRadius.circular($styles.corners.md)),
      child: title,
    );
  }
}
