import 'package:flutter/material.dart';

import '../../app/app_styles.dart';
import '../../main.dart';

class AppStyleBase extends StatelessWidget {
  final Widget child;
  const AppStyleBase({super.key, required this.child});

  static AppStyle get style => _style;
  static AppStyle _style = AppStyle();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    _style = AppStyle(screenSize: screenSize);

    return KeyedSubtree(
      key: ValueKey($styles.scale),
      child: Theme(
        data: $styles.toThemeData(),
        child: DefaultTextStyle(
          style: $styles.text.bodySmall,
          child: child,
        ),
      ),
    );
  }
}
