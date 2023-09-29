import 'package:flutter/material.dart';

@immutable
class AppInsets {
  final double scale;
  AppInsets(this.scale);

  late final double p2 = 2 * scale;
  late final double p4 = 4 * scale;
  late final double p6 = 6 * scale;
  late final double p8 = 8 * scale;
  late final double p10 = 10 * scale;
  late final double p12 = 12 * scale;
  late final double p14 = 14 * scale;
  late final double p16 = 16 * scale;
  late final double p18 = 18 * scale;
  late final double p20 = 20 * scale;
  late final double p22 = 22 * scale;
  late final double p24 = 24 * scale;
  late final double p26 = 26 * scale;
  late final double p28 = 28 * scale;
  late final double p30 = 30 * scale;
  late final double p32 = 32 * scale;
  late final double p34 = 34 * scale;
  late final double p36 = 36 * scale;
  late final double p38 = 38 * scale;
  late final double p40 = 40 * scale;
  late final double p42 = 42 * scale;
  late final double p48 = 48 * scale;
  late final double p54 = 54 * scale;
  late final double p60 = 60 * scale;
  late final double p64 = 64 * scale;
}

@immutable
class Corners {
  late final double sm = 4;
  late final double md = 8;
  late final double lg = 32;
}

@immutable
class Dimens {
  late final double appBarHeight = 44;
}
