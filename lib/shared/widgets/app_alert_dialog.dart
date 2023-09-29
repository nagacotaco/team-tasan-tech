import 'package:flutter/material.dart';
import '../../main.dart';
import 'app_button.dart';

/// カスタム [AlertDialog] ウィジェット。
///
/// [AppAlertDialog] は主にアプリ内ダイアログに使用。
///
/// 関連項目:
///
class AppAlertDialog extends StatelessWidget {
  /// 水平のアクションボタンを持つ [AppAlertDialog] を作成。
  ///
  /// [affirmativeActions] と [dismissiveActions] はnull非許容
  const AppAlertDialog.withHorizontalButtons({
    Key? key,
    this.title,
    this.content,
    required this.affirmativeActions,
    required this.dismissiveActions,
  })  : actionButtonArrangement = Axis.horizontal,
        actions = null,
        super(key: key);

  /// 垂直のアクションボタンを持つ [AppAlertDialog] を作成。
  ///
  /// [actions] はnull非許容
  const AppAlertDialog.withVerticalButtons({
    Key? key,
    this.title,
    this.content,
    required this.actions,
  })  : actionButtonArrangement = Axis.vertical,
        affirmativeActions = null,
        dismissiveActions = null,
        super(key: key);

  final Widget? title;

  final Widget? content;

  final Axis actionButtonArrangement;

  final List<Widget>? actions;

  /// [affirmativeActions] 押下時は説明文の内容[content]の処理が実行される。
  /// 「削除する」や「終了」のような破壊的アクションもこっちで設定

  final AppButton? affirmativeActions;

  /// [dismissiveActions]はキャンセルなどの非認証ボタンとして設定する
  ///

  final AppButton? dismissiveActions;

  /// ダイアログのコンテンツとアクションボタンを作成する
  ///
  /// [actionButtonArrangement] に基づいてボタンのレイアウトを決定。
  Widget buildActionContent(BuildContext context) {
    if (actionButtonArrangement == Axis.vertical) {
      return content ?? const SizedBox.shrink();
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (content != null) content!,
          SizedBox(height: $styles.insets.p40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: dismissiveActions!,
              ),
              Flexible(
                flex: 0,
                child: SizedBox(width: $styles.insets.p8),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: affirmativeActions!,
              )
            ],
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular($styles.corners.md),
        ),
      ),
      scrollable: true,
      backgroundColor: $styles.colors.backgroundColors.white,
      surfaceTintColor: $styles.colors.backgroundColors.white,
      title: title,
      content: buildActionContent(context),
      actions: actionButtonArrangement == Axis.vertical ? actions : null,
      contentTextStyle: $styles.text.bodySmall
          .copyWith(color: $styles.colors.textColors.secondary),
      titlePadding: EdgeInsets.only(
        left: $styles.insets.p24,
        right: $styles.insets.p24,
        top: $styles.insets.p24,
      ),
      titleTextStyle: $styles.text.titleMediumBold,
      contentPadding: EdgeInsets.only(
        left: $styles.insets.p24,
        right: $styles.insets.p24,
        top: $styles.insets.p16,
        bottom: actionButtonArrangement == Axis.vertical
            ? $styles.insets.p24
            : $styles.insets.p20,
      ),
    );
  }
}
