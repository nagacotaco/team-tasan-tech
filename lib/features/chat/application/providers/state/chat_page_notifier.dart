import 'dart:convert';

import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:team_tasan_tech/app/app_strings.dart';
import 'package:team_tasan_tech/features/chat/application/providers/level_provider.dart';
import 'package:team_tasan_tech/features/chat/application/providers/theme_provider.dart';
import 'package:team_tasan_tech/features/chat/domain/use_cases/chat_gpt_use_case.dart';
import 'package:team_tasan_tech/injector.dart';
import 'package:team_tasan_tech/models/domain/chat_gpt_respons_model.dart';
import 'package:team_tasan_tech/models/domain/chat_model.dart';

part 'chat_page_notifier.g.dart';

@riverpod
class ChatPageNotifier extends _$ChatPageNotifier {
  final _chatGptUseCase = injector<ChatGptUseCase>();

  /// ユーザー入力文章
  final userInputTextController = TextEditingController();

  /// ローディング状況で画面描画を制御
  bool isLoading = false;

  /// 会話ラリーの回数カウンター
  int counter = 0;

  /// chatGPTの全会話リスト
  /// 画面表示にも使用
  List<OpenAIChatCompletionChoiceMessageModel> chatGptModelList = [];

  @override
  ChatModel build() {
    ref.onDispose(() {
      userInputTextController.dispose();
    });
    initChatGpt(ref.read(themeProvider), ref.read(levelProvider));
    return const ChatModel();
  }

  Future<void> initChatGpt(String theme, String level) async {
    debugPrint('chatGPTを初期化します');
    chatGptModelList.add(
      OpenAIChatCompletionChoiceMessageModel(
        content: ChatGptReqStrings.firstPrompt
            .replaceAll('SCENE_TEXT', theme)
            .replaceAll('CONVERSATION_LEVEL', level),
        role: OpenAIChatMessageRole.user,
      ),
    );
    sendFunction();
  }

  /// ユーザーが入力した文章の送信時処理
  Future<void> onSendMessage() async {
    debugPrint('chaGPTへメッセージを送信します。');
    state = state.copyWith(userCommentList: [
      ...state.userCommentList,
      userInputTextController.text,
    ]);

    final newMessageModel = OpenAIChatCompletionChoiceMessageModel(
      content: userInputTextController.text,
      role: OpenAIChatMessageRole.user,
    );

    // インプットフィールドをクリア
    userInputTextController.clear();

    chatGptModelList.add(newMessageModel);
    sendFunction();
  }

  Future<void> sendFunction() async {
// chatGPTへ送信
    final response = await _chatGptUseCase.sendMessage(chatGptModelList);
    print(response);
    // 返答をjson化
    var json = jsonDecode(response.choices.first.message.content);
    print(json);

    chatGptModelList.add(response.choices.first.message);

    counter++;

    // レスポンスをstateへ適応
    state = state.copyWith(
      chatGptResList: [
        ...state.chatGptResList,
        ChatGptResponseModel.fromJson(json)
      ],
    );
  }

  /// chatGPT送信前のプロンプト処理
  /// これまでの履歴を含んだプロンプトを再構築
  String convertModelToPrompt() {
    const res = '';
    return res;
  }
}

final dummyChatModel = ChatModel(
  theme: '新しいギターを買いたい',
  day: DateTime.now(),
  userCommentList: [
    'I have 30000 yen.',
    "I have a Les Paul now and I'd like a strat type.",
  ],
  chatGptResList: [
    const ChatGptResponseModel(
      correct: '',
      reason: '',
      res: 'Good! What is your budget?',
    ),
    const ChatGptResponseModel(
      correct: 'Budget is 30,000 yen.',
      reason: '予算の英語は"budget"です。このような単語を使用したほうが望ましいですが、おっしゃった回答でも問題はありません。',
      res: 'Great! What kind of guiter type do you want?',
    ),
    const ChatGptResponseModel(correct: '', reason: '', res: ''),
  ],
);
