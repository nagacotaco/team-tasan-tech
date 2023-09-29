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
