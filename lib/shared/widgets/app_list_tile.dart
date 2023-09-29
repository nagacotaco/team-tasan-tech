import 'package:flutter/material.dart';

import '../../main.dart';
import 'app_image.dart';

/// * AppListTile
/// アプリ内で使用するListTile
class AppListTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final void Function()? onTap;
  final double? verticalPadding;
  final double? horizontalPadding;
  final bool bottomBorder;
  const AppListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.verticalPadding,
    this.horizontalPadding,
    this.bottomBorder = true,
  });

  /// * AppListTile.leadingIcon
  /// 左端に任意のアイコンが表示される
  factory AppListTile.leadingIcon({
    required String title,
    required IconData iconData,
    String? subtitle,
    Widget? trailing,
    void Function()? onTap,
    double? verticalPadding,
    double? horizontalPadding,
    bool bottomBorder = true,
  }) {
    return AppListTile(
      title: title,
      subtitle: subtitle,
      leading: Icon(iconData, size: $styles.insets.p20),
      trailing: trailing,
      onTap: onTap,
      verticalPadding: verticalPadding,
      horizontalPadding: horizontalPadding,
      bottomBorder: bottomBorder,
    );
  }

  /// * AppListTile.nextPage
  /// 右端にアイコン[Icons.arrow_forward_ios]が表示される
  /// ページ遷移を明確にする目的で使用 => onTapはnull非許容
  factory AppListTile.nextPage({
    required String title,
    required void Function() onTap,
    String? subtitle,
    Widget? leading,
    double? verticalPadding,
    double? horizontalPadding,
    bool bottomBorder = true,
  }) {
    return AppListTile(
      title: title,
      subtitle: subtitle,
      leading: leading,
      trailing: Icon(Icons.arrow_forward_ios, size: $styles.insets.p16),
      onTap: onTap,
      verticalPadding: verticalPadding,
      horizontalPadding: horizontalPadding,
      bottomBorder: bottomBorder,
    );
  }

  /// * AppListTile.profile
  /// 左端に円形の画像が表示される
  /// 主にユーザーのプロフィールなどで使用
  /// [imageProvider]には[NetworkImage]または[AssetImage]を使用する
  factory AppListTile.profile({
    required String title,
    required ImageProvider imageProvider,
    double? imageSize,
    String? subtitle,
    Widget? trailing,
    double? verticalPadding,
    double? horizontalPadding,
    void Function()? onTap,
    bool bottomBorder = true,
  }) {
    return AppListTile(
      title: title,
      subtitle: subtitle,
      leading: AppImage.circular(
        image: imageProvider,
        size: imageSize ?? $styles.insets.p48,
      ),
      trailing: trailing,
      onTap: onTap,
      verticalPadding: verticalPadding,
      horizontalPadding: horizontalPadding,
      bottomBorder: bottomBorder,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: bottomBorder
                ? $styles.colors.borderColors.primary
                : Colors.transparent,
          ),
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          vertical: verticalPadding ?? $styles.insets.p4,
          horizontal: horizontalPadding ?? $styles.insets.p4,
        ),
        leading: leading,
        title: Text(title),
        subtitle: subtitle != null ? Text(subtitle!) : null,
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }
}
