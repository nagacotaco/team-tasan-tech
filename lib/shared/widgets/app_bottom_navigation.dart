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
            icon: const Icon(Icons.home_outlined),
            label: 'ホーム',
            selectedIcon:
                Icon(Icons.home, color: $styles.colors.keyColor.primary)),
        NavigationDestination(
          icon: const Icon(Icons.settings_outlined),
          label: '設定',
          selectedIcon:
              Icon(Icons.settings, color: $styles.colors.keyColor.primary),
        )
      ],
      selectedIndex: currentIndex,
      onDestinationSelected: (index) => onTapped(index),
    );
  }
}
