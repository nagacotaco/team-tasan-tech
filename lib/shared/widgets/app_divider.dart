import 'package:flutter/material.dart';
import '../../main.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: $styles.colors.keyColor.accent,
      height: 1,
    );
  }
}
