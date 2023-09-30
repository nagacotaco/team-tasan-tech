// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

@immutable
class AppColors {
  final _KeyColors keyColor = const _KeyColors();
  final _FunctionalColors functionalColors = const _FunctionalColors();
  final _TextColors textColors = const _TextColors();
  final _BorderColors borderColors = const _BorderColors();
  final _BackgroundColors backgroundColors = const _BackgroundColors();
}

@immutable
class _KeyColors {
  const _KeyColors();
  Color get primary => const Color(0xFF0057A8);
  Color get secondary => const Color(0xFF0070BA);
  Color get tertiary => const Color(0xFFEBF7FD);
  Color get accent => const Color(0xFFE0E0E0);
  Color get transparent => const Color(0x00000000);
}

@immutable
class _FunctionalColors {
  const _FunctionalColors();
  Color get success => const Color(0xFF89E487);
  Color get error => const Color(0xFFFF4B55);
  Color get action => const Color(0xFF0057A8);
  Color get inactive => const Color(0xFFD3D3D3);
}

@immutable
class _TextColors {
  const _TextColors();
  Color get primary => const Color(0xFF333333);
  Color get secondary => const Color(0xFF666666);
  Color get tertiary => const Color(0xFF999999);
  Color get link => const Color(0xFF0057A8);
  Color get white => const Color(0xFFFFFFFF);
}

@immutable
class _BorderColors {
  const _BorderColors();
  Color get primary => const Color(0xFFD3D3D3);
}

@immutable
class _BackgroundColors {
  const _BackgroundColors();
  Color get white => const Color(0xFFFFFFFF);
  Color get black => const Color(0xFF171717);
  Color get accent => const Color(0xFFF9F9F9);
}

@immutable
class Shadows {
  final BoxShadow smallShadow = BoxShadow(
    color: const Color(0xFF000000).withOpacity(0.08),
    offset: const Offset(0.0, 2.0),
    blurRadius: 6.0,
  );

  final BoxShadow mediumShadow = BoxShadow(
    color: const Color(0xFF000000).withOpacity(0.1),
    offset: const Offset(0.0, 4.0),
    blurRadius: 12.0,
  );

  final BoxShadow largeShadow = BoxShadow(
    color: const Color(0xFF000000).withOpacity(0.3),
    offset: const Offset(0.0, 8.0),
    blurRadius: 20.0,
  );
}
