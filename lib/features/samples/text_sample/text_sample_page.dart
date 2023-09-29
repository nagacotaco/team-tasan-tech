import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../main.dart';

class TextSamplePage extends ConsumerWidget {
  const TextSamplePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('テキスト')),
      body: SafeArea(
        child: CustomScrollView(
          // コンテンツの高さがScrollViewを超えた時のみスクロールするようにする
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: EdgeInsets.all($styles.insets.p24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '日本語',
                            style: $styles.text.headlineMedium,
                          ),
                          SizedBox(
                            height: $styles.insets.p16,
                          ),
                          const Text(
                            'どうやらアトモスフェアの高い位置まで到達したようだった。空は真っ暗で、星の瞬きもなくなっていた。丘の上では彼方に広がる水平線が同じ高さに見えるのと同じ錯覚によって、眼下に真っ暗な雲が広がり、車は巨大な暗い空間の真ん中に浮いているように見えた。その空間の上半分は銀色にきらめいていた。',
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'English',
                            style: $styles.text.headlineMedium,
                          ),
                          SizedBox(
                            height: $styles.insets.p16,
                          ),
                          const Text(
                            'It seemed we had reached a high altitude in the atmosphere. The sky was pitch black, devoid of the twinkle of stars. Atop the hill, due to the same illusion that makes the horizon appear level in the distance, a vast expanse of dark clouds spread below us, making the car appear as if it was floating in the middle of a massive dark void. The upper half of that space shimmered in silver.',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
