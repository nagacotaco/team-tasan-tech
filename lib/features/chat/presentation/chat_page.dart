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
import '../../../shared/widgets/app_image.dart';

class ChatPage extends ConsumerWidget {
  const ChatPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double textFormFieldHeight = 60.0;
    final pageState = ref.watch(chatPageNotifierProvider);
    final pageNotifier = ref.watch(chatPageNotifierProvider.notifier);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  // * sample 1
                  SliverAppBar(
                    title: const Text(''),
                    // trueの場合、ユーザーが下にスクロールするとアプリバーはすぐに表示defaultは`false`
                    floating: false,
                    toolbarHeight: $styles.dimens.appBarHeight,
                  ),
                  // * sample 2
                  SliverAppBar(
                    // trueの場合、ユーザーが下にスクロールするとアプリバーはすぐに表示
                    floating: false,
                    toolbarHeight: context.sizeHeight * .14,
                    automaticallyImplyLeading: false,
                    flexibleSpace: const AppImage(
                        fit: BoxFit.fitWidth,
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1682687221073-53ad74c2cad7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80')),
                  ),
                  // * sample 3
                  SliverAppBar(
                    title: Text(ref.read(homePageStateProvider).testMode ==
                            TestMode.specificTopic
                        ? ref
                            .read(homePageStateProvider)
                            .currentTopic!
                            .keyStringJp
                        : ref.read(themeProvider)),
                    toolbarHeight: $styles.dimens.appBarHeight,
                    // falseでタイトル左側に表示
                    centerTitle: false,
                    automaticallyImplyLeading: false,
                    // スクロール時にアップバーを固定
                    pinned: true,
                    actions: const [
                      // IconButton(
                      //     alignment: Alignment.topCenter,
                      //     onPressed: () {},
                      //     icon: const Icon(
                      //       Icons.add,
                      //     )),
                      // IconButton(
                      //     padding: EdgeInsets.all($styles.insets.p4),
                      //     onPressed: () {},
                      //     icon: const Icon(
                      //       Icons.search,
                      //     ))
                    ],
                  ),
                  SliverList.builder(
                    itemCount: pageState.conversationList.length,
                    itemBuilder: (context, i) {
                      // if (i == 0) return const SizedBox.shrink();
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: $styles.insets.p16,
                        ),
                        child: ChatBubble.normal(
                          chatText: pageState.conversationList[i].res,
                          isUserComment:
                              pageState.conversationList[i].role == 'user',
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
                color: $styles.colors.backgroundColors.accent,
                child: Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: TextFormField(
                        controller: pageNotifier.userInputTextController,
                        decoration: const InputDecoration(
                          hintText: '会話文を入力する',
                        ),
                        validator: (value) {
                          return null;

                          // todo 空文字の場合はエラー返す（日本語がある場合どうする？）
                          // final result = ValidationUtil.isValidEmail(value ?? '');
                          // if (!result['isValid']) {
                          //   return result['error'];
                          // }
                          // return null;
                        },
                      ),
                    ),
                    SizedBox(width: $styles.insets.p8),
                    InkWell(
                      onTap: () async {
                        await pageNotifier.onSendMessage();
                        if (!pageState.isLoading && pageNotifier.counter >= 3) {
                          // 完了した会話を保持
                          pageNotifier.setFinishedConversation();
                          // ignore: use_build_context_synchronously
                          context.pushNamed(Routes.report.name);
                        }
                      },
                      child: Container(
                        height: $styles.insets.p40,
                        width: $styles.insets.p40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: $styles.colors.keyColor.primary,
                        ),
                        child: const Icon(Icons.arrow_upward),
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
