import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_tasan_tech/features/chat/application/providers/current_conversation_provider.dart';
import 'package:team_tasan_tech/features/chat/application/providers/theme_provider.dart';
import 'package:team_tasan_tech/features/chat/presentation/widgets/chat_bubble.dart';
import 'package:team_tasan_tech/features/home/application/page_model/home_page_model.dart';
import 'package:team_tasan_tech/features/home/application/provider/home_page_notifier.dart';
import 'package:team_tasan_tech/shared/widgets/app_divider.dart';

import '../../../main.dart';

class ReportPage extends ConsumerWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatState = ref.watch(currentConversationProvider);
    final conversationList = chatState?.conversationList;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              title: Text(ref.read(homePageStateProvider).testMode ==
                      TestMode.specificTopic
                  ? ref.read(homePageStateProvider).currentTopic!.keyStringJp
                  : ref.read(themeProvider)),
              floating: true,
              toolbarHeight: $styles.dimens.appBarHeight,
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              SizedBox(
                height: $styles.insets.p24,
              ),
              Padding(
                padding: EdgeInsets.all($styles.insets.p16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'お疲れさまでした🎈',
                      style: $styles.text.headlineMedium,
                    ),
                    SizedBox(height: $styles.insets.p4),
                    Text(
                      'テストを振り返り復習しましょう。',
                      style: $styles.text.titleMediumBold
                          .copyWith(color: $styles.colors.textColors.tertiary),
                    ),
                    SizedBox(height: $styles.insets.p20),
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 6,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular($styles.corners.sm),
                            color: $styles.colors.keyColor.primary,
                          ),
                        ),
                        SizedBox(width: $styles.insets.p8),
                        Text('${chatState!.score}点',
                            style: $styles.text.displayMedium),
                      ],
                    ),
                    SizedBox(height: $styles.insets.p24),
                    Text(
                      '会話内容',
                      style: $styles.text.titleMediumBold,
                    ),
                    SizedBox(height: $styles.insets.p12),
                    const AppDivider(),
                  ],
                ),
              )
            ])),
            SliverList.builder(
              itemCount: conversationList!.length,
              itemBuilder: (context, i) {
                if (i == 0) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: $styles.insets.p16,
                    ),
                    child: ChatBubble.normal(
                      chatText: conversationList[i].res,
                      isUserComment: false,
                    ),
                  );
                }
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: $styles.insets.p16,
                  ),
                  child: i % 2 != 0
                      ? ChatBubble.report(
                          chatText: conversationList[i].res,
                          correctText: conversationList[i + 1].correct,
                          reasonText: conversationList[i + 1].reason,
                          score: conversationList[i + 1].score,
                        )
                      : ChatBubble.normal(
                          chatText: conversationList[i].res,
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
