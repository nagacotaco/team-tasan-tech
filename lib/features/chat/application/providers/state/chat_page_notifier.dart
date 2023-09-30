import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:team_tasan_tech/features/chat/domain/use_cases/chat_gpt_use_case.dart';
import 'package:team_tasan_tech/injector.dart';
import 'package:team_tasan_tech/models/domain/chat_gpt_respons_model.dart';
import 'package:team_tasan_tech/models/domain/chat_model.dart';

part 'chat_page_notifier.g.dart';

@riverpod
class ChatPageNotifier extends _$ChatPageNotifier {
  final userInputText = TextEditingController();
  final _chatGptUseCase = injector<ChatGptUseCase>();
  @override
  ChatModel build() {
    ref.onDispose(() {
      userInputText.dispose();
    });
    return const ChatModel();
  }

  /// ユーザーが入力した文章の送信時処理
  Future<void> onSendMessage() async {
    // chatGPTへ送信
    final ChatGptResponseModel response =
        await _chatGptUseCase.sendMessage(userInputText.text);
    // レスポンスをstateへ適応
    state = state.copyWith(
      userCommentList: state.userCommentList..add(userInputText.text),
      chatGptResList: state.chatGptResList..add(response),
    );
    // インプットフィールドをクリア
    userInputText.clear();
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
