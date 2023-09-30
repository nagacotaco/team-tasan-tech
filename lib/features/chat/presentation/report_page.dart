import 'package:flutter/material.dart';
import 'package:team_tasan_tech/features/chat/presentation/widgets/chat_bubble.dart';
import 'package:team_tasan_tech/shared/extensions/build_context_extensions.dart';

import '../../../main.dart';
import '../application/providers/state/chat_page_notifier.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // * sample 1
            SliverAppBar(
              title: const Text('シーンタイトルを受け取る'),
              // trueの場合、ユーザーが下にスクロールするとアプリバーはすぐに表示defaultは`false`
              floating: false,
              toolbarHeight: $styles.dimens.appBarHeight,
            ),
            // * sample 2
            SliverAppBar(
              // trueの場合、ユーザーが下にスクロールするとアプリバーはすぐに表示
              floating: false,
              toolbarHeight: context.sizeHeight * .10,
              automaticallyImplyLeading: false,
              flexibleSpace: Padding(
                padding: EdgeInsets.only(left: $styles.insets.p12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: $styles.insets.p30),
                    Text('Congratulations!',
                        style: $styles.text.headlineMedium),
                    SizedBox(height: $styles.insets.p20),
                  ],
                ),
              ),
            ),
            // * sample 3
            SliverAppBar(
              title: Container(
                padding: EdgeInsets.only(left: $styles.insets.p12),
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: $styles.colors.keyColor.primary,
                      width: $styles.insets.p6,
                    ),
                  ),
                ),
                child: Text('80点', style: $styles.text.headlineLarge),
              ),
              toolbarHeight: $styles.dimens.appBarHeight,
              // falseでタイトル左側に表示
              centerTitle: false,
              automaticallyImplyLeading: false,
              // スクロール時にアップバーを固定
              pinned: true,
              actions: const [],
            ),
            SliverList.builder(
              itemCount: dummyChatModel.conversationList.length,
              itemBuilder: (context, i) {
                if (i == 0) {
                  return ChatBubble.normal(
                    chatText: dummyChatModel.conversationList[i].res,
                    isUserComment: false,
                  );
                }
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: $styles.insets.p16,
                  ),
                  child: i % 2 != 0
                      ? ChatBubble.report(
                          chatText: dummyChatModel.conversationList[i].res,
                          correctText:
                              dummyChatModel.conversationList[i + 1].correct,
                          reasonText:
                              dummyChatModel.conversationList[i + 1].reason,
                          score: dummyChatModel.conversationList[i + 1].score,
                        )
                      : ChatBubble.normal(
                          chatText: dummyChatModel.conversationList[i].res,
                          isUserComment: false,
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
