import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:team_tasan_tech/features/chat/application/providers/state/chat_page_notifier.dart';
import 'package:team_tasan_tech/features/chat/application/providers/theme_provider.dart';
import 'package:team_tasan_tech/features/chat/presentation/widgets/chat_bubble.dart';
import 'package:team_tasan_tech/features/home/application/page_model/home_page_model.dart';
import 'package:team_tasan_tech/features/home/application/provider/home_page_notifier.dart';
import 'package:team_tasan_tech/routes/app_router.dart';
import 'package:team_tasan_tech/shared/extensions/build_context_extensions.dart';

import '../../../main.dart';

class ChatPage extends ConsumerWidget {
  const ChatPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double textFormFieldHeight = context.sizeHeight * .1;
    final pageState = ref.watch(chatPageNotifierProvider);
    final pageNotifier = ref.watch(chatPageNotifierProvider.notifier);
    // 進捗を取得
    final progress = ref.watch(chatPageNotifierProvider.notifier).progress;

    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    title: Text(ref.read(homePageStateProvider).testMode ==
                            TestMode.specificTopic
                        ? ref
                            .read(homePageStateProvider)
                            .currentTopic!
                            .keyStringJp
                        : ref.read(themeProvider)),
                    toolbarHeight: $styles.dimens.appBarHeight,
                    centerTitle: false,
                    automaticallyImplyLeading: false,
                    floating: true,
                    actions: const [CloseButton()],
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(1),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: $styles.insets.p16),
                        child: LinearProgressIndicator(
                          value: progress,
                          borderRadius:
                              BorderRadius.circular($styles.corners.lg),
                        ),
                      ),
                    ),
                  ),
                  SliverList(
                      delegate: SliverChildListDelegate([
                    SizedBox(
                      height: $styles.insets.p24,
                    )
                  ])),
                  SliverList.builder(
                    itemCount: pageState.conversationList.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: $styles.insets.p16,
                        ),
                        child: ChatBubble.normal(
                          chatText: pageState.conversationList[i].res,
                          isUserComment:
                              pageState.conversationList[i].role == 'user',
                          totalRepeatCount: 1,
                        ),
                      );
                    },
                  ),
                  SliverToBoxAdapter(
                    child: pageState.isLoading
                        ? Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: $styles.insets.p16,
                            ),
                            child: ChatBubble.normal(
                              chatText: '.....',
                              isUserComment: false,
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: $styles.insets.p16),
                height: textFormFieldHeight,
                width: context.sizeWidth,
                child: Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: TextFormField(
                        controller: pageNotifier.userInputTextController,
                        maxLines: 5,
                        minLines: 1,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: $styles.insets.p12,
                            vertical: $styles.insets.p8,
                          ),
                          hintText: '会話文を入力する',
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular($styles.corners.lg),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular($styles.corners.lg),
                            borderSide: BorderSide(
                              color: $styles.colors.keyColor.accent, // フォーカス時の色
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            // 非フォーカス時の枠線
                            borderRadius:
                                BorderRadius.circular($styles.corners.lg),
                            borderSide: BorderSide(
                              color: $styles
                                  .colors.keyColor.accent, // 非フォーカス時の色を指定
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: $styles.insets.p8),
                    InkWell(
                      onTap: () async {
                        await pageNotifier.onSendMessage();
                        if (!pageState.isLoading &&
                            pageNotifier.counter >= 10) {
                          // 完了した会話を保持
                          pageNotifier.setFinishedConversation();
                          // ignore: use_build_context_synchronously
                          context.pushNamed(Routes.report.name);
                        }
                      },
                      child: Container(
                        height: $styles.insets.p32,
                        width: $styles.insets.p32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: $styles.colors.keyColor.primary,
                        ),
                        child: Icon(
                          size: 20,
                          Icons.arrow_upward,
                          color: $styles.colors.backgroundColors.white,
                        ),
                      ),
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
