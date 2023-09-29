import 'package:flutter/material.dart';

import '../../main.dart';

extension AppTextThemeBold on TextTheme {
  TextStyle get titleLargeBold => $styles.text.titleLargeBold;

  TextStyle get titleMediumBold => $styles.text.titleMediumBold;

  TextStyle get titleSmallBold => $styles.text.titleSmallBold;

  TextStyle get labelLargeBold => $styles.text.labelLargeBold;

  TextStyle get labelMediumBold => $styles.text.labelMediumBold;

  TextStyle get labelSmallBold => $styles.text.labelSmallBold;
}
