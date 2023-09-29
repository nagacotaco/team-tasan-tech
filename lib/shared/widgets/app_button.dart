import 'package:flutter/material.dart';

import '../../main.dart';

/// * AppButton
/// アプリ内で使用するボタン
/// 基本的には[AppButton.solid],[AppButton.outline],[AppButton.text],[AppButton.alert]を使用
class AppButton extends StatelessWidget {
  final String label;
  final void Function() onTap;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? labelColor;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  const AppButton({
    super.key,
    required this.label,
    required this.onTap,
    this.height,
    this.width,
    this.backgroundColor,
    this.borderColor,
    this.labelColor,
    this.prefixIcon,
    this.suffixIcon,
  });

  /// * AppButton.solid
  /// 塗りが適応されたボタン
  /// デフォルトでは、プライマリカラーが適応される
  /// options: prefix or suffixIcon
  factory AppButton.solid({
    required String label,
    required void Function() onTap,
    double? height,
    double? width,
    Color? backgroundColor,
    Color? labelColor,
    IconData? prefixIcon,
    IconData? suffixIcon,
  }) {
    if (prefixIcon != null && suffixIcon != null) {
      throw ArgumentError("prefixIcon と suffixIcon はどちらか一つしか設定できません");
    }
    return AppButton(
      label: label,
      onTap: onTap,
      height: height,
      width: width,
      backgroundColor: backgroundColor,
      labelColor: labelColor ?? $styles.colors.textColors.white,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
    );
  }

  /// * AppButton.outline
  /// 線が適応されたボタン
  /// デフォルトでは、プライマリカラーが適応される
  /// /// options: prefix or suffixIcon
  factory AppButton.outline({
    required String label,
    required void Function() onTap,
    double? height,
    double? width,
    Color? borderColor,
    Color? labelColor,
    IconData? prefixIcon,
    IconData? suffixIcon,
  }) {
    if (prefixIcon != null && suffixIcon != null) {
      throw ArgumentError("prefixIcon と suffixIcon はどちらか一つしか設定できません");
    }
    return AppButton(
      label: label,
      onTap: onTap,
      height: height,
      width: width,
      backgroundColor: $styles.colors.backgroundColors.white,
      borderColor: borderColor ?? $styles.colors.keyColor.primary,
      labelColor: labelColor ?? $styles.colors.keyColor.primary,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
    );
  }

  /// * AppButton.text
  /// テキストオンリーのボタン（塗り、線がない）
  factory AppButton.text({
    required String label,
    required void Function() onTap,
    double? height,
    double? width,
    Color? labelColor,
  }) {
    return AppButton(
      label: label,
      onTap: onTap,
      height: height,
      width: width,
      backgroundColor: Colors.transparent,
      labelColor: labelColor,
    );
  }

  /// * AppButton.alert
  /// アラートに限定されたボタン
  factory AppButton.alert({
    required String label,
    required void Function() onTap,
    double? height,
    double? width,
  }) {
    return AppButton(
      label: label,
      onTap: onTap,
      height: height,
      width: width,
      backgroundColor: $styles.colors.functionalColors.error,
      labelColor: $styles.colors.textColors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular($styles.corners.md),
      child: Container(
        height: height ?? 44,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular($styles.corners.md),
          border: Border.all(color: borderColor ?? Colors.transparent),
          color: backgroundColor ?? $styles.colors.keyColor.primary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: prefixIcon != null,
              child: Padding(
                padding: EdgeInsets.only(right: $styles.insets.p8),
                child: Icon(
                  prefixIcon,
                  size: $styles.insets.p20,
                  color: labelColor ?? $styles.colors.textColors.primary,
                ),
              ),
            ),
            Flexible(
              child: Text(
                label,
                style: $styles.text.titleSmallBold.copyWith(
                  color: labelColor ?? $styles.colors.textColors.primary,
                ),
              ),
            ),
            Visibility(
              visible: suffixIcon != null,
              child: Padding(
                padding: EdgeInsets.only(left: $styles.insets.p8),
                child: Icon(
                  suffixIcon,
                  size: $styles.insets.p20,
                  color: labelColor ?? $styles.colors.textColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
