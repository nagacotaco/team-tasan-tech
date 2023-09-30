import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_tasan_tech/features/home/application/provider/home_page_notifier.dart';
import 'package:team_tasan_tech/main.dart';

class BottomSheetMenu<T> extends ConsumerWidget {
  final String title;
  final String? subtitle;
  final T value;
  final ValueChanged<T> onTap;

  const BottomSheetMenu({
    Key? key,
    required this.title,
    this.subtitle,
    required this.value,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homePageState = ref.watch(homePageStateProvider);
    final isSelected =
        (homePageState.testMode == value || homePageState.level == value);

    return Material(
      child: InkWell(
        onTap: () => onTap(value),
        child: Ink(
          decoration: BoxDecoration(
            color: $styles.colors.keyColor.transparent,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: $styles.insets.p16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: isSelected
                            ? $styles.text.titleMediumBold.copyWith(
                                color: $styles.colors.keyColor.secondary,
                              )
                            : $styles.text.titleMediumBold.copyWith(
                                color: $styles.colors.textColors.secondary),
                      ),
                      if (subtitle != null)
                        Text(subtitle!,
                            style: isSelected
                                ? $styles.text.bodySmall.copyWith(
                                    color: $styles.colors.keyColor.secondary)
                                : $styles.text.bodySmall.copyWith(
                                    color:
                                        $styles.colors.textColors.secondary)),
                    ],
                  ),
                ),
                isSelected
                    ? SizedBox(
                        width: 32,
                        height: 32,
                        child: Icon(
                          Icons.check_rounded,
                          size: 32,
                          color: $styles.colors.functionalColors.success,
                        ),
                      )
                    : const SizedBox(
                        width: 32,
                        height: 32,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
