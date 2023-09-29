import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:team_tasan_tech/shared/extensions/build_context_extensions.dart';

import '../../main.dart';

/// * AppBottomSheet
/// アプリ内で使用するボトムシート
/// コンテンツは別ウィジェットかビュー側に記載
/// [showCloseButton] = trueにする場合は、以下の設定を推奨
/// [showDrugHandle] = false
/// [isDismissible] = false
/// [enableDrag] = false
class AppBottomSheet {
  void showAppBottomSheet({
    required BuildContext context,
    required Widget child,
    ScrollPhysics? physics,
    String? title,
    bool showDrugHandle = true,
    bool showCloseButton = false,
    // --↓showModalBottomSheetのプロパティ↓--
    bool? isDismissible,
    bool? enableDrag,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(maxHeight: context.sizeHeight),
      elevation: 0,
      backgroundColor: Colors.transparent,
      isDismissible: isDismissible ?? true,
      enableDrag: enableDrag ?? true,
      builder: (context) {
        return _AppDraggableScrollableSheet(
          physics: physics,
          title: title,
          showDrugHandle: showDrugHandle,
          showCloseButton: showCloseButton,
          child: child,
        );
      },
    );
  }
}

class _AppDraggableScrollableSheet extends StatefulWidget {
  final Widget child;
  final ScrollPhysics? physics;
  final String? title;
  final bool showDrugHandle;
  final bool showCloseButton;
  const _AppDraggableScrollableSheet({
    required this.child,
    this.physics,
    this.title,
    this.showDrugHandle = true,
    this.showCloseButton = false,
  });

  @override
  State<_AppDraggableScrollableSheet> createState() =>
      _AppDraggableScrollableSheetState();
}

class _AppDraggableScrollableSheetState
    extends State<_AppDraggableScrollableSheet> {
  // GlobalKey型のインスタンスを定義
  final GlobalKey key = GlobalKey();
  // RenderBox型の変数を定義。Widgetの2次元情報を取得するために必要
  late RenderBox renderBox;
  // 初期値を設定しないとエラーになるため0.0を設定
  double columnHeight = 0.0;

  final double sheetMaxSizeRate = .95;
  final double sheetRadius = 16.0;
  final double sheetPadding = $styles.insets.p8;

  final double gripHeight = $styles.insets.p6;
  final double gripWidth = $styles.insets.p40;
  final double gripMargin = $styles.insets.p8;

  @override
  void initState() {
    // buildメソッドが回り、AppBarの描画終了後に、GlobalKeyの情報を取得するようにするため、
    // addPostFrameCallbackメソッドを実行
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // GlobalKeyを通じてAppBarの2次元情報を取得
      // null safety対応で?と右辺にas RenderBoxをつける
      renderBox = key.currentContext?.findRenderObject() as RenderBox;
      // 2次元情報からAppBarの高さ（縦幅）を取得
      columnHeight = renderBox.size.height;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double getContentHeight() {
      double contentHeight =
          columnHeight + sheetPadding + gripMargin * 2 + gripHeight;
      double extraHeight = widget.showCloseButton ? $styles.insets.p30 : 0.0;
      return contentHeight + (widget.title != null ? 22.4 : 0.0) + extraHeight;
    }

    return DraggableScrollableSheet(
      initialChildSize:
          getContentHeight() / context.sizeHeight > sheetMaxSizeRate
              ? sheetMaxSizeRate
              : getContentHeight() / context.sizeHeight,
      maxChildSize: getContentHeight() / context.sizeHeight > sheetMaxSizeRate
          ? sheetMaxSizeRate
          : getContentHeight() / context.sizeHeight,
      minChildSize: getContentHeight() / context.sizeHeight / 2,
      snap: true,
      expand: false,
      builder: (BuildContext context, ScrollController scrollController) {
        return Stack(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: gripMargin * 2 + gripHeight,
              ),
              padding: EdgeInsets.only(
                left: sheetPadding,
                top: sheetPadding,
                right: sheetPadding,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(sheetRadius),
                color: $styles.colors.backgroundColors.white,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Flexible(
                        fit: FlexFit.tight,
                        child: SizedBox.shrink(),
                      ),
                      widget.title != null
                          ? Flexible(
                              fit: FlexFit.tight,
                              child: Center(
                                child: Text(
                                  widget.title!,
                                  style: $styles.text.titleMediumBold,
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                      widget.showCloseButton
                          ? Flexible(
                              fit: FlexFit.tight,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                  onTap: () => context.pop(),
                                  child: Container(
                                    height: $styles.insets.p30,
                                    width: $styles.insets.p30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: $styles
                                          .colors.backgroundColors.black
                                          .withOpacity(.1),
                                    ),
                                    child: Icon(
                                      Icons.close,
                                      size: $styles.insets.p16,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : const Flexible(
                              fit: FlexFit.tight,
                              child: SizedBox.shrink(),
                            ),
                    ],
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: SingleChildScrollView(
                      controller: scrollController,
                      physics: widget.physics ?? const BouncingScrollPhysics(),
                      child: Column(
                        key: key,
                        children: [
                          widget.child,
                          SizedBox(
                            height: MediaQuery.of(context).padding.bottom,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: (context.sizeWidth / 2) - (gripWidth / 2) - sheetPadding,
              child: Visibility(
                visible: widget.showDrugHandle,
                child: Container(
                  margin: EdgeInsets.all(gripMargin),
                  height: gripHeight,
                  width: gripWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(gripHeight / 2),
                    color: $styles.colors.backgroundColors.white,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
