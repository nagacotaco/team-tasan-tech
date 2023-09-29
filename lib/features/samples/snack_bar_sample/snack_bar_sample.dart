import 'package:flutter/material.dart';
import '../../../shared/widgets/app_image.dart';

import '../../../../main.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_snack_bar.dart';

class SnackBarSamplePage extends StatelessWidget {
  const SnackBarSamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('スナックバー')),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all($styles.insets.p24),
                child: Column(
                  children: [
                    AppButton.alert(
                      label: 'スナックバー(タイトル + 説明文 + アクション)',
                      onTap: () {
                        AppSnackBar.show(
                          context,
                          title: 'ここにタイトルが入ります。',
                          description: 'ここに説明文が補足で入ります。',
                          action: '閉じる',
                          actionCallback: () => debugPrint('スナックバー表示'),
                          prefixWidget: AspectRatio(
                            aspectRatio: 1 / 1,
                            child: AppImage.cornerLg(
                              fit: BoxFit.cover,
                              image: const NetworkImage(
                                'https://images.unsplash.com/photo-1694594594401-82aa8102535b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3087&q=80',
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: $styles.insets.p16),
                    // タイトル + 説明文 + closeアイコン
                    AppButton.alert(
                      label: 'スナックバー(タイトル + 説明文 + closeアイコン)',
                      onTap: () {
                        AppSnackBar.show(
                          context,
                          title: '無邪気ガリレオ',
                          description: 'カラフルスクリーム',
                          showCloseIcon: true,
                          prefixWidget: AspectRatio(
                            aspectRatio: 4 / 3,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular($styles.corners.sm),
                              child: AppImage.cornerSm(
                                fit: BoxFit.cover,
                                image: const NetworkImage(
                                  'http://img.youtube.com/vi/b9pB8cLRzRA/hqdefault.jpg',
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: $styles.insets.p16),
                    AppButton.alert(
                      label: 'スナックバー(ピクトグラム + タイトル + 説明文二行 + action)',
                      onTap: () {
                        AppSnackBar.show(
                          context,
                          title: 'タイトル',
                          description: 'ここに説明文が入ります。ここに説明文が入ります。ここに説明文が入ります。',
                          action: 'アクション',
                          actionCallback: () => debugPrint('woo'),
                          prefixWidget: Icon(
                            Icons.info_outline,
                            // サイズ32推奨
                            size: 32,
                            color: $styles.colors.keyColor.accent,
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
