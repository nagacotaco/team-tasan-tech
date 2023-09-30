import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/widgets/app_bottom_navigation.dart';
import '../../../account/presentation/account_page.dart';
import '../../../user/application/providers/state/user_model_notifier.dart';
import 'home_page.dart';

class BottomNavigationPageController extends ConsumerStatefulWidget {
  const BottomNavigationPageController({Key? key}) : super(key: key);

  @override
  ConsumerState<BottomNavigationPageController> createState() =>
      _BottomNavigationPageControllerState();
}

class _BottomNavigationPageControllerState
    extends ConsumerState<BottomNavigationPageController> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    ref.read(userModelNotifierProvider);
    return Scaffold(
      // appBar: const CustomAppBar(),
      body: buildBody(),
      bottomNavigationBar: AppBottomNavigation(
        currentIndex: _currentIndex,
        onTapped: _onTabTapped,
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      // log('index $index');
      _currentIndex = index;
    });
  }

  Widget buildBody() {
    switch (_currentIndex) {
      case 0:
        return const HomePage();
      case 2:
        return const AccountPage();
      default:
        return Container();
    }
  }
}
