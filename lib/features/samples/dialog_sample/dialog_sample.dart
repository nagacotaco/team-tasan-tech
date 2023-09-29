import 'package:flutter/material.dart';

import '../../../../main.dart';
import '../../../../shared/widgets/app_alert_dialog.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_divider.dart';
import '../../../shared/widgets/app_bottom_sheet.dart';
import '../../../shared/widgets/app_list_tile.dart';

class DialogSamplePage extends StatefulWidget {
  const DialogSamplePage({super.key});

  @override
  State<DialogSamplePage> createState() => _DialogSamplePageState();
}

class _DialogSamplePageState extends State<DialogSamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ダイアログ')),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all($styles.insets.p24),
                child: Column(
                  children: [
                    SizedBox(height: $styles.insets.p8),
                    AppButton.solid(
                      prefixIcon: Icons.dark_mode_outlined,
                      label: 'ダイアログ（縦）',
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AppAlertDialog.withVerticalButtons(
                              title: const Text(
                                '期間限定のキャンペーンやクーポンなどの情報をお知らせします！',
                                textAlign: TextAlign.center,
                              ),
                              content: const Text(
                                'プッシュ通知をオンにして、オトクな情報を見逃さないようにしましょう。',
                                textAlign: TextAlign.center,
                              ),
                              actions: [
                                AppButton.solid(
                                  label: 'オンにする',
                                  onTap: () {},
                                ),
                                SizedBox(height: $styles.insets.p16),
                                AppButton.text(
                                  label: '後で',
                                  onTap: () {},
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    SizedBox(height: $styles.insets.p16),
                    AppButton.alert(
                      label: 'ダイアログ（横）',
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AppAlertDialog.withHorizontalButtons(
                              title: const Text(
                                'このコンピューターを信頼しますか？',
                              ),
                              content: const Text(
                                '設定とデータはワイヤレスまたはケーブルで接続されたときにアクセスできるようになります。',
                              ),
                              affirmativeActions: AppButton.solid(
                                label: '信頼しない',
                                onTap: () {},
                                labelColor: $styles.colors.textColors.white,
                                backgroundColor:
                                    $styles.colors.functionalColors.action,
                              ),
                              dismissiveActions: AppButton.outline(
                                label: '信頼',
                                labelColor: $styles.colors.textColors.secondary,
                                borderColor:
                                    $styles.colors.functionalColors.inactive,
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                    SizedBox(height: $styles.insets.p16),
                    const AppDivider(),
                    SizedBox(height: $styles.insets.p16),
                    AppButton.solid(
                      label: 'ボトムシート',
                      onTap: () {
                        AppBottomSheet().showAppBottomSheet(
                          context: context,
                          // physics: const NeverScrollableScrollPhysics(),
                          // title: '設定',
                          // showDrugHandle: true,
                          // showCloseButton: true,
                          child: Column(
                            children: [
                              AppListTile.nextPage(
                                title: 'アカウント',
                                onTap: () {},
                              ),
                              AppListTile.nextPage(
                                title: '簡単引き継ぎQRコード',
                                onTap: () {},
                              ),
                              AppListTile.nextPage(
                                title: 'アカウント引き継ぎ',
                                onTap: () {},
                              ),
                              AppListTile.nextPage(
                                title: 'スタンプ',
                                onTap: () {},
                              ),
                              AppListTile.nextPage(
                                title: '着せ替え',
                                onTap: () {},
                              ),
                              AppListTile.nextPage(
                                title: 'コイン',
                                onTap: () {},
                              ),
                              AppListTile.nextPage(
                                title: '通知',
                                onTap: () {},
                              ),
                              AppListTile.nextPage(
                                title: '写真と動画',
                                onTap: () {},
                              ),
                              AppListTile.nextPage(
                                title: 'スタンプ',
                                onTap: () {},
                              ),
                              AppListTile.nextPage(
                                title: '着せ替え',
                                onTap: () {},
                              ),
                              AppListTile.nextPage(
                                title: 'コイン',
                                onTap: () {},
                              ),
                              AppListTile.nextPage(
                                title: '通知',
                                onTap: () {},
                              ),
                              AppListTile.nextPage(
                                title: '写真と動画',
                                onTap: () {},
                              ),
                            ],
                          ),
                        );
                      },
                    ),
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
