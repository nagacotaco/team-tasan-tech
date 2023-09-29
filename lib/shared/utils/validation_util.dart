/// バリデーションのユーティリティクラス。
///
/// 使用例:
/// ```
/// final result = ValidationUtil.isValidEmail('example@email.com');
/// if (result['isValid']) {
///   ...
/// } else {
///   エラー文を表示
///   print(result['error']);
/// }
/// ```

class ValidationUtil {
  /// メールアドレスが有効かどうかを検証
  ///
  /// 正規表現説明: メールアドレス形式に一致するか確認
  static Map<String, dynamic> isValidEmail(String email) {
    final RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return _evaluateRegex(email, regex, '無効なメールアドレスです');
  }

  /// パスワードが有効かどうかを検証
  ///
  /// 正規表現説明: 大文字、小文字、数字がそれぞれ1つ以上含まれているか確認
  static Map<String, dynamic> isValidPassword(String password) {
    if (password.length < 8) {
      return {'isValid': false, 'error': 'パスワードは8文字以上である必要があります'};
    }
    final hasUpper = _containsPattern(password, r'[A-Z]');
    final hasLower = _containsPattern(password, r'[a-z]');
    final hasDigit = _containsPattern(password, r'\d');

    if (hasUpper && hasLower && hasDigit) {
      return {'isValid': true, 'error': null};
    } else {
      return {'isValid': false, 'error': '大文字、小文字、数字を含む必要があります'};
    }
  }

  /// 年齢が有効かどうかを検証
  static Map<String, dynamic> isValidAge(int age) {
    return (age >= 0 && age <= 130)
      ? {'isValid': true, 'error': null}
      : {'isValid': false, 'error': '無効な年齢です'};
  }

  /// 名前が有効かどうかを検証
  static Map<String, dynamic> isValidName(String name) {
    return (name.isNotEmpty && name.length <= 20)
          ? {'isValid': true, 'error': null}
          : {'isValid': false, 'error': '名前は1〜20文字である必要があります'};
  }

  /// 電話番号が有効かどうかを検証
  ///
  /// 正規表現説明: 国際形式（+と1〜9の数字で始まり、4〜15桁）に一致するか確認
  static Map<String, dynamic> isValidPhoneNumber(String phoneNumber) {
    final RegExp regex = RegExp(r'^\+[1-9]{1}[0-9]{3,14}$');
    return _evaluateRegex(phoneNumber, regex, '無効な電話番号です');
  }

  /// 日付が有効かどうかを検証
  ///
  /// 正規表現説明: YYYY-MM-DD 形式に一致するか確認
  static Map<String, dynamic> isValidDate(String date) {
    final RegExp regex = RegExp(r'^\d{4}-\d{2}-\d{2}$');
    return _evaluateRegex(date, regex, '無効な日付形式です');
  }

  /// 文字列が正規表現にマッチするかを評価し、結果を返す
  static Map<String, dynamic> _evaluateRegex(
      String input, RegExp regex, String errorMessage) {
    return regex.hasMatch(input)
        ? {'isValid': true, 'error': null}
        : {'isValid': false, 'error': errorMessage};
  }

  /// 文字列がパターンを含むかどうかを評価
  static bool _containsPattern(String input, String pattern) {
    return input.contains(RegExp(pattern));
  }
}
