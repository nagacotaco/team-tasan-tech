import 'package:flutter/material.dart';

import '../../main.dart';

/// * AppImage
/// アプリ内でImageWidgetを使用する際は[AppImage]を推奨
/// - 画像取得時にエラーが出た際のエラー用UIが表示(NetworkImage)
/// - 画像の角丸が容易に実装可能
/// imageプロパティには[NetworkImage]もしくは、[AssetImage]を使用
/// [AppImage.cornerSm],[AppImage.cornerMd],[AppImage.cornerLg]の角丸サイズは[$styles.corners]に依存
class AppImage extends StatelessWidget {
  final ImageProvider image;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final double? rTopLeft;
  final double? rTopRight;
  final double? rBottomLeft;
  final double? rBottomRight;
  const AppImage({
    super.key,
    required this.image,
    this.height,
    this.width,
    this.fit,
    this.rTopLeft,
    this.rTopRight,
    this.rBottomLeft,
    this.rBottomRight,
  });

  factory AppImage.cornerSm({
    required ImageProvider image,
    double? height,
    double? width,
    BoxFit? fit,
  }) {
    return AppImage(
      image: image,
      height: height,
      width: width,
      fit: fit,
      rTopLeft: $styles.corners.sm,
      rTopRight: $styles.corners.sm,
      rBottomLeft: $styles.corners.sm,
      rBottomRight: $styles.corners.sm,
    );
  }

  factory AppImage.cornerMd({
    required ImageProvider image,
    double? height,
    double? width,
    BoxFit? fit,
  }) {
    return AppImage(
      image: image,
      height: height,
      width: width,
      fit: fit,
      rTopLeft: $styles.corners.md,
      rTopRight: $styles.corners.md,
      rBottomLeft: $styles.corners.md,
      rBottomRight: $styles.corners.md,
    );
  }

  factory AppImage.cornerLg({
    required ImageProvider image,
    double? height,
    double? width,
    BoxFit? fit,
  }) {
    return AppImage(
      image: image,
      height: height,
      width: width,
      fit: fit,
      rTopLeft: $styles.corners.lg,
      rTopRight: $styles.corners.lg,
      rBottomLeft: $styles.corners.lg,
      rBottomRight: $styles.corners.lg,
    );
  }

  factory AppImage.circular({
    required ImageProvider image,
    required double size,
  }) {
    return AppImage(
      image: image,
      height: size,
      width: size,
      fit: BoxFit.cover,
      rTopLeft: size / 2,
      rTopRight: size / 2,
      rBottomLeft: size / 2,
      rBottomRight: size / 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: rTopLeft != null ? Radius.circular(rTopLeft!) : Radius.zero,
        topRight: rTopRight != null ? Radius.circular(rTopRight!) : Radius.zero,
        bottomLeft:
            rBottomLeft != null ? Radius.circular(rBottomLeft!) : Radius.zero,
        bottomRight:
            rBottomRight != null ? Radius.circular(rBottomRight!) : Radius.zero,
      ),
      child: Image(
        image: image,
        height: height,
        width: width,
        fit: fit,
        errorBuilder: (context, object, stackTrace) {
          debugPrint('Load failed: ${context.toString()}');
          return Container(
            height: height,
            width: width,
            color: $styles.colors.backgroundColors.accent,
            child: Icon(
              Icons.broken_image,
              color: $styles.colors.textColors.tertiary,
              size: (height == null && width == null)
                  ? $styles.insets.p20
                  : (height! >= width!)
                      ? width! / 2
                      : height! / 2,
            ),
          );
        },
      ),
    );
  }
}
