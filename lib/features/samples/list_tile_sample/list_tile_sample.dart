import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_tasan_tech/shared/widgets/app_list_tile.dart';

import '../../../main.dart';

class ListTileSample extends ConsumerWidget {
  const ListTileSample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('リストタイル')),
      body: SafeArea(
        child: CustomScrollView(
          // コンテンツの高さがScrollViewを超えた時のみスクロールするようにする
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: true,
              child: Padding(
                padding: EdgeInsets.all($styles.insets.p24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ファクトリーコンストラクタ一覧',
                      style: $styles.text.titleMediumBold,
                    ),
                    Text(
                      '以下３種類はファクトリーコンストラクタのrequiredプロパティを設定した場合のUIです。\nこれら全てに\n・subtitle\n・leading([.next]の場合)\n・trailing([.leadingIcon], [.profile]の場合)\nを設定可能です。',
                      style: $styles.text.labelSmall,
                    ),
                    SizedBox(height: $styles.insets.p8),
                    AppListTile.profile(
                      title: '阿部寛',
                      imageProvider: const NetworkImage(
                        'http://abehiroshi.la.coocan.jp/abe-top-20190328-2.jpg',
                      ),
                    ),
                    AppListTile.leadingIcon(
                      title: '履歴',
                      iconData: Icons.history,
                    ),
                    AppListTile.nextPage(title: 'データの削除', onTap: () {}),
                    SizedBox(height: $styles.insets.p16),
                    Text(
                      '応用アイデア',
                      style: $styles.text.titleMediumBold,
                    ),
                    SizedBox(height: $styles.insets.p8),
                    AppListTile.profile(
                      title: '阿部寛',
                      subtitle:
                          '爆速でWebサイトを表示するためのノウハウを発信しています。Webサイトの表示速度にお困りの方はぜひフォローをお勧めします。',
                      imageProvider: const NetworkImage(
                        'http://abehiroshi.la.coocan.jp/abe-top-20190328-2.jpg',
                      ),
                      trailing: Container(
                        padding: EdgeInsets.all($styles.insets.p4),
                        color: $styles.colors.keyColor.primary,
                        child: Text(
                          'フォロー中',
                          style: $styles.text.labelSmall
                              .copyWith(color: $styles.colors.textColors.white),
                        ),
                      ),
                      bottomBorder: false,
                    ),
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
