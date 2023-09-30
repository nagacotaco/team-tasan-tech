import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../main.dart';
import '../../../../routes/app_router.dart';
import '../../../../shared/widgets/app_list_tile.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample List'),
      ),
      body: SafeArea(
        child: CustomScrollView(
          // コンテンツの高さがScrollViewを超えた時のみスクロールするようにする
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: EdgeInsets.all($styles.insets.p24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppListTile.nextPage(
                      title: 'テキスト',
                      onTap: () => context.pushNamed(
                        Routes.textSample.name,
                      ),
                    ),
                    AppListTile.nextPage(
                      title: 'ダイアログ',
                      onTap: () => context.pushNamed(
                        Routes.dialogSample.name,
                      ),
                    ),
                    AppListTile.nextPage(
                      title: 'スナックバー',
                      onTap: () => context.pushNamed(
                        Routes.snackBarSample.name,
                      ),
                    ),
                    AppListTile.nextPage(
                      title: 'テキストフィールド',
                      onTap: () => context.pushNamed(
                        Routes.textFieldSample.name,
                      ),
                    ),
                    AppListTile.nextPage(
                      title: 'リストタイル',
                      onTap: () =>
                          context.pushNamed(Routes.listTileSample.name),
                    ),
                    AppListTile.nextPage(
                      title: 'アップバー',
                      onTap: () => context.pushNamed(Routes.appBarSample.name),
                    ),
                    AppListTile.nextPage(
                      title: 'チャットページ',
                      onTap: () => context.pushNamed(
                        Routes.chat.name,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
