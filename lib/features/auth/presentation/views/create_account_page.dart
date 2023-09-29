import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../main.dart';
import '../../../../routes/app_router.dart';
import '../../../../shared/utils/validation_util.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_snack_bar.dart';
import '../../application/providers/state/auth_notifier.dart';

class CreateAccountPage extends ConsumerStatefulWidget {
  const CreateAccountPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateAccountPageState();
}

class _CreateAccountPageState extends ConsumerState<CreateAccountPage> {
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
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
        title: const Text('アカウント作成'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all($styles.insets.p28),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Form(
                      key: _formKey,
                      autovalidateMode: _autoValidate
                          ? AutovalidateMode.always
                          : AutovalidateMode.disabled,
                      child: Column(
                        children: [
                          // メールアドレスのバリデーション
                          TextFormField(
                            controller: mailController,
                            decoration: InputDecoration(
                              labelText: 'メールアドレス',
                              errorStyle: TextStyle(
                                  color: $styles.colors.functionalColors.error),
                            ),
                            validator: (value) {
                              final result =
                                  ValidationUtil.isValidEmail(value ?? '');
                              if (!result['isValid']) {
                                return result['error'];
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: $styles.insets.p28),
                          // パスワードのバリデーション
                          TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              labelText: 'パスワード',
                              errorStyle: TextStyle(
                                  color: $styles.colors.functionalColors
                                      .error), // エラーメッセージのスタイル
                            ),
                            obscureText: true,
                            validator: (value) {
                              final result =
                                  ValidationUtil.isValidPassword(value ?? '');
                              if (!result['isValid']) {
                                return result['error'];
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: $styles.insets.p24),
                          AppButton.solid(
                            label: '作成する',
                            backgroundColor: $styles.colors.keyColor.primary,
                            onTap: () async {
                              if (_formKey.currentState?.validate() == true) {
                                try {
                                  await fireAuthNotifier.createAccount(
                                      mailController.text,
                                      passwordController.text);
                                  // ignore: use_build_context_synchronously
                                  context
                                      .pushReplacementNamed(Routes.home.name);
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
                              } else {
                                // 一つ以上のフィールドが無効な場合、自動バリデーションを有効にする
                                setState(() {
                                  _autoValidate = true;
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
