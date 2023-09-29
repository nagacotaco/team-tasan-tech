import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_tasan_tech/main.dart';

import '../../../shared/utils/validation_util.dart';
import '../../../shared/widgets/app_button.dart';

class TextFieldSamplePage extends ConsumerStatefulWidget {
  const TextFieldSamplePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TextFieldSamplePageState();
}

class _TextFieldSamplePageState extends ConsumerState<TextFieldSamplePage> {
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('テキストフィールド')),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all($styles.insets.p24),
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      autovalidateMode: _autoValidate
                          ? AutovalidateMode.always
                          : AutovalidateMode.disabled,
                      child: Column(
                        children: [
                          // メールアドレスのバリデーション
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'メールアドレス',
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
                          SizedBox(height: $styles.insets.p16),
                          // パスワードのバリデーション
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'パスワード',
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
                          SizedBox(height: $styles.insets.p16),
                          AppButton.solid(
                            label: '送信',
                            backgroundColor: $styles.colors.keyColor.secondary,
                            onTap: () {
                              if (_formKey.currentState?.validate() == true) {
                                // フォームのデータが全て有効な場合の処理
                                debugPrint('フォームが有効です');
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
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
