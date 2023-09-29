import 'package:flutter/cupertino.dart';
import '../main.dart';

@immutable
class AppTextStyles {
  final double scale;
  AppTextStyles(this.scale);

  /// * Display
  /// 最も大きなテキストとして、表示スタイルは短く、重要なテキストや数字のために予約されています。
  /// 大きな画面での使用に最適です。
  ///

  late final TextStyle defaultTextStyle = TextStyle(
    color: $styles.colors.textColors.primary,
    fontFamily: 'LineSeed',
    fontSize: 16,
  );

  late final TextStyle displayLarge = _createTextStyle(
    defaultTextStyle,
    sizePx: 40,
    weight: FontWeight.w300,
    spacingPc: 0,
    heightPx: 50,
  );
  late final TextStyle displayMedium = _createTextStyle(
    defaultTextStyle,
    sizePx: 36,
    weight: FontWeight.w400,
    spacingPc: 0,
    heightPx: 45,
  );

  late final TextStyle displaySmall = _createTextStyle(
    sizePx: 32,
    defaultTextStyle,
    weight: FontWeight.w400,
    spacingPc: 0,
    heightPx: 40,
  );

  /// *Headline
  ///
  /// [Headline]は[display]よりも小さい。
  /// 小さな画面上で短く、強調したいテキストに最適です。

  late final TextStyle headlineLarge = _createTextStyle(
    defaultTextStyle,
    sizePx: 30,
    weight: FontWeight.w600,
    spacingPc: 0,
    heightPx: 39,
  );
  late final TextStyle headlineMedium = _createTextStyle(
    defaultTextStyle,
    sizePx: 24,
    weight: FontWeight.w600,
    spacingPc: 0,
    heightPx: 31.2,
  );

  late final TextStyle headlineSmall = _createTextStyle(
    defaultTextStyle,
    sizePx: 20,
    weight: FontWeight.w600,
    spacingPc: 0,
    heightPx: 26,
  );

  /// * Title
  /// [Title] は [Headline]よりも小さい。
  /// 短く、中程度の強調テキストに使用すべきです。
  ///

  late final TextStyle titleLarge = _createTextStyle(
    defaultTextStyle,
    sizePx: 18,
    weight: FontWeight.w400,
    spacingPc: 0,
    heightPx: 25.2,
  );
  late final TextStyle titleMedium = _createTextStyle(
    defaultTextStyle,
    sizePx: 16,
    weight: FontWeight.w400,
    spacingPc: 0,
    heightPx: 22.4,
  );

  late final TextStyle titleSmall = _createTextStyle(
    defaultTextStyle,
    sizePx: 14,
    weight: FontWeight.w400,
    spacingPc: 0,
    heightPx: 19.6,
  );
  late final TextStyle titleLargeBold = _createTextStyle(
    defaultTextStyle,
    sizePx: 18,
    weight: FontWeight.w700,
    spacingPc: 0,
    heightPx: 25.2,
  );
  late final TextStyle titleMediumBold = _createTextStyle(
    defaultTextStyle,
    sizePx: 16,
    weight: FontWeight.w700,
    spacingPc: 0,
    heightPx: 22.4,
  );

  late final TextStyle titleSmallBold = _createTextStyle(
    defaultTextStyle,
    sizePx: 14,
    weight: FontWeight.w700,
    spacingPc: 0,
    heightPx: 19.6,
  );

  /// * Label
  ///ラベルスタイルはより小さく、実用的なスタイルであり、UIの部分やコンポーネント内のテキスト、
  ///または内容の中の非常に小さい補足テキスト、キャプションなどに使用されます。
  ///[ElevatedButton]、[TextButton]、[OutlinedButton]のテキストに使用されます。

  late final TextStyle labelLarge = _createTextStyle(
    defaultTextStyle,
    sizePx: 12,
    weight: FontWeight.w400,
    spacingPc: 0,
    heightPx: 18,
  );
  late final TextStyle labelMedium = _createTextStyle(
    defaultTextStyle,
    sizePx: 11,
    weight: FontWeight.w400,
    spacingPc: 0,
    heightPx: 16.5,
  );

  late final TextStyle labelSmall = _createTextStyle(
    defaultTextStyle,
    sizePx: 10,
    weight: FontWeight.w400,
    spacingPc: 0,
    heightPx: 15,
  );
  late final TextStyle labelLargeBold = _createTextStyle(
    defaultTextStyle,
    sizePx: 12,
    weight: FontWeight.w700,
    spacingPc: 0,
    heightPx: 18,
  );
  late final TextStyle labelMediumBold = _createTextStyle(
    defaultTextStyle,
    sizePx: 11,
    weight: FontWeight.w700,
    spacingPc: 0,
    heightPx: 16.5,
  );

  late final TextStyle labelSmallBold = _createTextStyle(
    defaultTextStyle,
    sizePx: 10,
    weight: FontWeight.w700,
    spacingPc: 0,
    heightPx: 15,
  );

  /// * Body
  /// ボディスタイルは長い文章のテキストに使用されます。[bodyMedium]は[Material]のデフォルトのテキストスタイルです。

  late final TextStyle bodyLarge = _createTextStyle(
    defaultTextStyle,
    sizePx: 18,
    weight: FontWeight.w400,
    spacingPc: 0,
    heightPx: 27,
  );
  late final TextStyle bodyMedium = _createTextStyle(
    defaultTextStyle,
    sizePx: 16,
    weight: FontWeight.w400,
    spacingPc: 0,
    heightPx: 24,
  );

  late final TextStyle bodySmall = _createTextStyle(
    defaultTextStyle,
    sizePx: 14,
    weight: FontWeight.w400,
    spacingPc: 0,
    heightPx: 21,
  );

  TextStyle _createTextStyle(TextStyle style,
      {required double sizePx,
      double? heightPx,
      double? spacingPc,
      FontWeight? weight}) {
    sizePx *= scale;
    if (heightPx != null) {
      heightPx *= scale;
    }
    debugPrint('$scaleでテキストスタイルを生成');
    return style.copyWith(
        fontSize: sizePx,
        height: heightPx != null ? (heightPx / sizePx) : sizePx,
        letterSpacing: spacingPc != null ? sizePx * spacingPc * 0.01 : 0,
        fontWeight: weight);
  }
}
