import 'package:animated_text_kit/animated_text_kit.dart';
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
    bool isAnimation = true,
    int? totalRepeatCount,
  }) {
    return ChatBubble(
      chatText: chatText,
      isUserComment: isUserComment,
      child: isUserComment || !isAnimation
          ? Text(chatText, style: $styles.text.bodySmall)
          : AnimatedTextKit(
              animatedTexts: [TypewriterAnimatedText(chatText)],
              totalRepeatCount: totalRepeatCount ?? 3,
            ),
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
            style: $styles.text.titleSmallBold
                .copyWith(color: $styles.colors.functionalColors.success),
          ),
          SizedBox(height: $styles.insets.p2),
          Text(chatText, style: $styles.text.bodySmall),
          SizedBox(height: $styles.insets.p12),
          const AppDivider(),
          SizedBox(height: $styles.insets.p12),
          Text(
            '修正',
            style: $styles.text.titleSmallBold.copyWith(
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
    return Flexible(
      child: Align(
        alignment: isUserComment ? Alignment.centerRight : Alignment.centerLeft,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: context.sizeWidth * 0.7),
          child: Container(
            margin: EdgeInsets.only(bottom: $styles.insets.p16),
            padding: EdgeInsets.all($styles.insets.p12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: isUserComment
                    ? Radius.circular($styles.corners.md)
                    : Radius.zero,
                topRight: Radius.circular($styles.corners.md),
                bottomLeft: Radius.circular($styles.corners.md),
                bottomRight: isUserComment
                    ? Radius.zero
                    : Radius.circular($styles.corners.md),
              ),
              color: isUserComment
                  ? $styles.colors.backgroundColors.accent
                  : $styles.colors.keyColor.tertiary,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
