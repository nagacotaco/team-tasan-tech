import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = StateProvider<String>((ref) {
  return '海外旅行前の英語練習がしたい';
});
