import 'package:flutter/material.dart';

import '../../main.dart';

class AppBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTapped;

  const AppBottomNavigation(
      {Key? key, required this.currentIndex, required this.onTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: [
        NavigationDestination(
          icon: const Icon(Icons.smart_toy_outlined),
          label: '会話テスト',
          selectedIcon:
              Icon(Icons.smart_toy, color: $styles.colors.keyColor.primary),
        ),
        NavigationDestination(
          icon: const Icon(Icons.history_outlined),
          label: 'レポート',
          selectedIcon:
              Icon(Icons.history, color: $styles.colors.keyColor.primary),
        ),
        NavigationDestination(
          icon: const Icon(Icons.settings_outlined),
          label: '設定',
          selectedIcon:
              Icon(Icons.settings, color: $styles.colors.keyColor.primary),
        ),
      ],
      selectedIndex: currentIndex,
      onDestinationSelected: (index) => onTapped(index),
    );
  }
}
