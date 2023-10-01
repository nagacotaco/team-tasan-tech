import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_insets.dart';
import 'app_text_styles.dart';
import 'app_times.dart';

@immutable
class AppStyle {
  AppStyle({Size? screenSize}) {
    if (screenSize == null) {
      scale = 1;
      return;
    }

    final shortestSide = screenSize.shortestSide;
    const tabletXl = 1000; // Typical large tablets
    const tabletLg = 800; // Medium-sized tablets
    const tabletSm = 600; // Smaller tablets like the iPad Mini
    const phoneDefault = 390; // default size like the iPhone 14
    const phoneSe = 320; // Original iPhone SE

    if (shortestSide >= tabletXl) {
      scale = 1.2; // Scaling for large tablets
    } else if (shortestSide >= tabletLg) {
      scale = 1.15; // Scaling for medium tablets
    } else if (shortestSide >= tabletSm) {
      scale = 1.1; // Scaling for smaller tablets
    } else if (shortestSide >= phoneDefault) {
      scale = 1; // Default scale for iPhone 14 and similar large phones
    } else if (shortestSide > phoneSe) {
      scale =
          .95; // Slightly reduced for phones between iPhone SE and iPhone 14
    } else {
      scale = .9; // For iPhone SE and similar-sized devices
    }

    debugPrint('screenSize=$screenSize, scale=$scale');
  }

  late final double scale;

  final AppColors colors = AppColors();

  late final Corners corners = Corners();

  late final Shadows shadows = Shadows();

  /// Padding and margin values
  late final AppInsets insets = AppInsets(scale);

  /// Size for Widget
  late final Dimens dimens = Dimens();

  /// Text styles
  late final AppTextStyles text = AppTextStyles(scale);

  /// Animation Durations
  final AppTimes times = AppTimes();
  final bool isDark = false;

  ThemeData toThemeData() {
    // カラーテーマ
    ColorScheme colorScheme = ColorScheme(
      // アプリに関する明るさを設定　例）light, dark
      brightness: isDark ? Brightness.dark : Brightness.light,
      // アプリ内で一番多く使われるメインカラーを設定
      primary: colors.keyColor.primary,
      // primaryの上に配置されているコンポーネントの色を設定
      onPrimary: colors.textColors.white,
      // アクセントカラーで使う色を設定
      secondary: colors.keyColor.secondary,
      // onPrimaryと同様にsecondaryの上に設置されたコンポーネントに適用される色を設定
      onSecondary: colors.textColors.white,
      // エラー発生時に表示するテキストの色を設定
      error: colors.functionalColors.error,
      // errorの上に設置されたコンポーネントに対する色を設定
      onError: colors.textColors.white,
      // 背景に適用される色を設定
      background: colors.backgroundColors.white,
      // 背景の上に設置されたコンポーネントに対する色を設定
      onBackground: colors.textColors.primary,
      // Cardなどの特定のwidgetの背景に適用される色を設定
      surface: colors.backgroundColors.white,
      // surfaceの上に設置されたコンポーネントに対する色を設定
      onSurface: colors.textColors.primary,
    );

    // テキストテーマ
    TextTheme textTheme = TextTheme(
      displayLarge: text.displayLarge,
      displayMedium: text.displayMedium,
      displaySmall: text.displaySmall,
      headlineLarge: text.headlineLarge,
      headlineMedium: text.headlineMedium,
      headlineSmall: text.headlineSmall,
      titleLarge: text.titleLarge,
      titleMedium: text.titleMedium,
      titleSmall: text.titleSmall,
      labelLarge: text.labelLarge,
      labelMedium: text.labelMedium,
      labelSmall: text.labelSmall,
      bodyLarge: text.bodyLarge,
      bodyMedium: text.bodyMedium,
      bodySmall: text.bodySmall,
    ).apply(
      bodyColor: colors.textColors.primary,
      displayColor: colors.textColors.primary,
    );

    NavigationBarThemeData navigationBarThemeData = NavigationBarThemeData(
      height: 50,
      backgroundColor: colors.backgroundColors.white,
      surfaceTintColor: colors.backgroundColors.white,
      indicatorColor: colors.backgroundColors.white,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      labelTextStyle:
          MaterialStatePropertyAll(text.labelSmall.copyWith(height: 1)),
      elevation: 1,
      shadowColor: colors.keyColor.accent,
      iconTheme: MaterialStatePropertyAll(
        IconThemeData(
          size: 26,
          color: colors.textColors.primary,
        ),
      ),
    );

    ListTileThemeData listTileThemeData = ListTileThemeData(
      titleTextStyle: text.titleSmallBold,
      subtitleTextStyle: text.labelSmall,
      minLeadingWidth: 0,
      iconColor: colors.textColors.primary,
      textColor: colors.textColors.primary,
      tileColor: colors.keyColor.transparent,
    );

    InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
      isDense: true,
      suffixIconColor: colors.keyColor.accent,
      prefixIconColor: colors.keyColor.accent,
      contentPadding: EdgeInsets.only(
        left: 0,
        right: 0,
        bottom: insets.p8,
      ),
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colors.borderColors.primary)),
      disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colors.borderColors.primary)),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colors.keyColor.primary)),
      helperStyle:
          text.labelMediumBold.copyWith(color: colors.textColors.tertiary),
      errorStyle:
          text.labelMediumBold.copyWith(color: colors.functionalColors.error),
      counterStyle: text.labelMediumBold,
      labelStyle: text.titleSmall.copyWith(color: colors.textColors.secondary),
      floatingLabelStyle:
          text.titleSmall.copyWith(color: colors.textColors.secondary),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      prefixStyle: text.bodySmall.copyWith(color: colors.textColors.tertiary),
      suffixStyle: text.bodySmall.copyWith(color: colors.textColors.tertiary),
      hintStyle: text.bodySmall.copyWith(color: colors.textColors.tertiary),
      activeIndicatorBorder: BorderSide(color: colors.keyColor.secondary),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: colors.functionalColors.error),
      ),
    );

    TextSelectionThemeData textSelectionThemeData = TextSelectionThemeData(
      cursorColor: colors.keyColor.primary,
      selectionColor: colors.keyColor.primary.withOpacity(.2),
      selectionHandleColor: colors.keyColor.primary,
    );

    AppBarTheme appBarTheme = AppBarTheme(
      titleTextStyle: text.titleMediumBold,
      toolbarTextStyle: text.titleMedium,
      backgroundColor: colors.backgroundColors.white,
      toolbarHeight: dimens.appBarHeight,
      surfaceTintColor: colors.backgroundColors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: colors.textColors.primary,
      ),
    );

    var t = ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: textTheme,
      navigationBarTheme: navigationBarThemeData,
      listTileTheme: listTileThemeData,
      inputDecorationTheme: inputDecorationTheme,
      textSelectionTheme: textSelectionThemeData,
      appBarTheme: appBarTheme,
      fontFamily: 'LineSeed',
      splashColor: colors.keyColor.transparent,
    );

    return t;
  }
}
