import 'package:flutter_riverpod/flutter_riverpod.dart';

final levelProvider = StateProvider<String>((ref) {
  return TestLevel.beginner.keyString;
});

enum TestLevel {
  beginner,
  standard,
  advanced;

  String get keyString {
    switch (this) {
      case TestLevel.beginner:
        return 'elementary school level in Japan';
      case TestLevel.standard:
        return 'Junior high school level in Japan';
      case TestLevel.advanced:
        return 'high school level in Japan';
    }
  }
}
