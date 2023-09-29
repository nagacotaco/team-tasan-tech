import 'package:flutter/material.dart';
import '../../main.dart';

class AppSnackBar {
  static show(
    BuildContext context, {
    String? title,
    String? description,
    Widget? prefixWidget,
    String? action,
    bool? showCloseIcon,
    void Function()? actionCallback,
  }) {
    // actionが設定されているが、snackbarActionが設定されていない場合に警告
    if (action != null && actionCallback == null) {
      throw ArgumentError('アクションラベルが設定されている場合は、actionCallbackを指定する必要があります。');
    }

    // actionとsnackbarActionが両方設定されている場合のみSnackBarActionを生成
    SnackBarAction? snackBarAction;
    if (action != null && actionCallback != null) {
      snackBarAction = SnackBarAction(
        label: action,
        onPressed: actionCallback,
        textColor: $styles.colors.textColors.white,
      );
    }

    final snackBar = SnackBar(
      content: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (prefixWidget != null)
            Flexible(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(right: $styles.insets.p8),
                  child: prefixWidget,
                )),
          Flexible(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (title != null)
                  Flexible(
                    child: Text(
                      title,
                      style: $styles.text.titleSmallBold
                          .copyWith(color: $styles.colors.textColors.white),
                    ),
                  ),
                if (description != null)
                  Flexible(
                    child: Text(
                      description,
                      style: $styles.text.labelMedium
                          .copyWith(color: $styles.colors.textColors.tertiary),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular($styles.corners.md),
      ),
      behavior: SnackBarBehavior.floating,
      action: snackBarAction,
      elevation: 0,
      backgroundColor: $styles.colors.backgroundColors.black.withOpacity(.8),
      clipBehavior: Clip.hardEdge,
      dismissDirection: DismissDirection.vertical,
      showCloseIcon: showCloseIcon,
      closeIconColor: $styles.colors.keyColor.accent,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
