import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_tasan_tech/features/chat/application/providers/state/chat_page_notifier.dart';
import 'package:team_tasan_tech/features/chat/presentation/widgets/chat_bubble.dart';
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
        child: Stack(
          children: [
            CustomScrollView(
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
                  title: const Text('シーンタイトルを受け取る'),
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
                  itemCount: pageNotifier.chatGptModelList.length,
                  itemBuilder: (context, i) {
                    if (i == 0) return const SizedBox.shrink();
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: $styles.insets.p16,
                      ),
                      child: ChatBubble.normal(
                        chatText: pageNotifier.chatGptModelList[i].content,
                        isUserComment: pageNotifier.chatGptModelList[i].role ==
                            OpenAIChatMessageRole.user,
                      ),
                    );
                  },
                ),
              ],
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
                      onTap: () => pageNotifier.onSendMessage(),
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
