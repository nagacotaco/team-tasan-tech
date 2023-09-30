import 'package:flutter/material.dart';
import 'package:team_tasan_tech/main.dart';

class SceneChip extends StatelessWidget {
  final Widget title;
  final VoidCallback onTap;
  const SceneChip({
    super.key,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        decoration: BoxDecoration(
          color: $styles.colors.backgroundColors.accent,
          borderRadius: BorderRadius.circular($styles.corners.md),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular($styles.corners.md),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: $styles.insets.p10,
              vertical: $styles.insets.p12,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular($styles.corners.md)),
            child: title,
          ),
        ),
      ),
    );
  }
}
