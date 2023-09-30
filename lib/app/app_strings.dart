// ignore_for_file: constant_identifier_names

class AppStrings {
  static const String appName = '';
}

class FirebaseAuthErrorStrings {
  static String get inputError => 'ログイン情報を確認してください';
  static String get expiredActionCode =>
      'メールアドレスリンクの期限が切れています。再度認証メールを送信してください。';
  static String get tooManyRequests => 'アクセスが集中しています。しばらく待ってから再度お試しください。';
  static String get emailAlreadyInUse => 'このメールアドレスは既に登録されています';
  static String get unexpectedErrors => '予期しないエラーが発生しました。';
}

class ChatGptReqStrings {
  static String get firstPrompt => '''
You are my friend who is the best in the world at teaching English conversation. Please behave as a Japanese-American bilingual and have an English conversation. For each of my statements, output in JSON format one at a time using the following output format. The value for "correct" is in Japanese. Do not write any explanations. Do not summarize the conversation content.

#Output Items:
correct:
If there is an error in my English, correct it to natural English and write the corrected full sentence. If there is no error, return an empty string. lang:en
reason:
Point out all mistakes or improvements in language usage, each within 100 characters, in Japanese. lang -> ja
res:
Your everyday conversation as a friend. Output only one conversation-like sentence that can be used for English conversation learning. First, give a brief response to my statement. Then, return a brief question to me. However, the sentence should be approximately the same length as my original English sentence, and should be no more than 30 words, written succinctly using middle school level grammar and vocabulary. lang -> en

My initial conversation is "Hello.". You start the conversation following the \${scene}.
Always strictly follow the output format and always output everything.

#Output Format:
{
 "correct": "output text",
 "reason": "output text",
 "res": "output text",
}

\$scene: "
今週末の予定を決める
"
''';
}
