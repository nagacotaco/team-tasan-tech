// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:team_tasan_tech/features/auth/application/providers/state/auth_notifier.dart';
import 'package:team_tasan_tech/shared/widgets/app_button.dart';

import '../../../main.dart';
import '../../../routes/app_router.dart';
import '../../../shared/widgets/app_alert_dialog.dart';

class AccountPage extends ConsumerWidget {
  const AccountPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.watch(firebaseAuthNotifierProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('アカウント'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              AppButton.solid(
                label: 'ログアウト',
                onTap: () async {
                  final res = await showDialog(
                    context: context,
                    builder: (context) {
                      return AppAlertDialog.withVerticalButtons(
                        title: const Text(
                          'ログアウトしますか？',
                          textAlign: TextAlign.center,
                        ),
                        actions: [
                          AppButton.solid(
                            label: 'OK',
                            onTap: () {
                              context.pop(true);
                            },
                          ),
                          SizedBox(height: $styles.insets.p16),
                          AppButton.text(
                            label: 'キャンセル',
                            onTap: () {
                              context.pop(false);
                            },
                          ),
                        ],
                      );
                    },
                  );
                  if (res) {
                    try {
                      await authNotifier.signOut();
                      context.pushReplacementNamed(Routes.login.name);
                    } catch (e) {}
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
