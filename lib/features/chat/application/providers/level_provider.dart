import 'package:flutter_riverpod/flutter_riverpod.dart';

final levelProvider = StateProvider<String>((ref) {
  return Level.beginner.keyString;
});

enum Level {
  beginner,
  standard,
  advance;

  String get keyString {
    switch (this) {
      case Level.beginner:
        return 'elementary school level in Japan';
      case Level.standard:
        return 'Junior high school level in Japan';
      case Level.advance:
        return 'high school level in Japan';
    }
  }
}
