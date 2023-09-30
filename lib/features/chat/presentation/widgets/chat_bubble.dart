import 'package:flutter/material.dart';
import 'package:team_tasan_tech/shared/extensions/build_context_extensions.dart';

import '../../../../main.dart';
import '../../../../shared/widgets/app_divider.dart';

class ChatBubble extends StatelessWidget {
  final String chatText;
  final bool isUserComment;
  final Widget child;
  final String? correctText;
  final String? reasonText;
  final int? score;
  const ChatBubble({
    super.key,
    required this.chatText,
    required this.isUserComment,
    required this.child,
    this.correctText,
    this.reasonText,
    this.score,
  });

  factory ChatBubble.normal({
    required String chatText,
    required bool isUserComment,
  }) {
    return ChatBubble(
      chatText: chatText,
      isUserComment: isUserComment,
      child: Text(chatText, style: $styles.text.bodySmall),
    );
  }

  factory ChatBubble.report({
    required String chatText,
    required String correctText,
    required String reasonText,
    required int score,
  }) {
    return ChatBubble(
      chatText: chatText,
      isUserComment: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'あなたの回答: $score点',
            style: $styles.text.labelLargeBold,
          ),
          SizedBox(height: $styles.insets.p2),
          Text(chatText, style: $styles.text.bodySmall),
          SizedBox(height: $styles.insets.p12),
          const AppDivider(),
          SizedBox(height: $styles.insets.p12),
          Text(
            '修正',
            style: $styles.text.labelLargeBold.copyWith(
              color: $styles.colors.functionalColors.error,
            ),
          ),
          SizedBox(height: $styles.insets.p2),
          Text(
            correctText.isNotEmpty ? correctText : '修正なし',
            style: $styles.text.labelLargeBold.copyWith(
              color: $styles.colors.textColors.tertiary,
            ),
          ),
          reasonText.isNotEmpty
              ? Padding(
                  padding: EdgeInsets.only(top: $styles.insets.p2),
                  child: Text(reasonText, style: $styles.text.bodySmall),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUserComment ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(bottom: $styles.insets.p20),
        padding: EdgeInsets.all($styles.insets.p12),
        width: context.sizeWidth * 0.7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: isUserComment
                ? Radius.circular($styles.corners.sm)
                : Radius.zero,
            topRight: Radius.circular($styles.corners.sm),
            bottomLeft: Radius.circular($styles.corners.sm),
            bottomRight: isUserComment
                ? Radius.zero
                : Radius.circular($styles.corners.sm),
          ),
          color: isUserComment
              ? $styles.colors.backgroundColors.accent
              : $styles.colors.backgroundColors.white,
        ),
        child: child,
      ),
    );
  }
}
