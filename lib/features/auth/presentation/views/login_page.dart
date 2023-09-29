import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:team_tasan_tech/shared/widgets/app_snack_bar.dart';

import '../../../../main.dart';
import '../../../../routes/app_router.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../application/providers/state/auth_notifier.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    mailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final fireAuthNotifier = ref.watch(firebaseAuthNotifierProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ログイン'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all($styles.insets.p28),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate([
                  Column(
                    children: [
                      // メールアドレスのバリデーション
                      TextFormField(
                        controller: mailController,
                        decoration: const InputDecoration(
                          labelText: 'メールアドレス',
                        ),
                      ),
                      SizedBox(height: $styles.insets.p28),
                      // パスワードのバリデーション
                      TextFormField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                          labelText: 'パスワード',
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: $styles.insets.p24),
                      AppButton.solid(
                        label: 'ログイン',
                        backgroundColor: $styles.colors.keyColor.primary,
                        onTap: () async {
                          try {
                            await fireAuthNotifier.login(
                                mailController.text, passwordController.text);
                            // ignore: use_build_context_synchronously
                            context.pushReplacementNamed(Routes.home.name);
                          } catch (e) {
                            // ignore: use_build_context_synchronously
                            AppSnackBar.show(
                              context,
                              title: 'エラー',
                              description: '$e',
                              prefixWidget: Icon(
                                Icons.info_outline,
                                // サイズ32推奨
                                size: 32,
                                color: $styles.colors.keyColor.accent,
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () =>
                        context.pushNamed(Routes.createAccount.name),
                    child: Text(
                      'アカウントを作成',
                      style: $styles.text.bodySmall.copyWith(
                        color: $styles.colors.textColors.link,
                      ),
                    ),
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
