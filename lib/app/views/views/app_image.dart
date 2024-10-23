import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_klikfilm/app/data/app_colors.dart';
import 'package:fl_klikfilm/app/data/app_shimmer.dart';
import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  const AppImage(
    this.imageUrl, {
    super.key,
    this.boxFit = BoxFit.fill,
    this.width,
    this.height,
    this.cacheKey,
    this.color,
    this.alignment,
    this.imageBuilder,
    this.borderRadius,
    this.repeat = ImageRepeat.noRepeat,
    this.onTap,
    this.placeHolder,
  });

  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit boxFit;
  final String? cacheKey;
  final Color? color;
  final Alignment? alignment;
  final ImageWidgetBuilder? imageBuilder;
  final BorderRadius? borderRadius;
  final ImageRepeat repeat;
  final void Function()? onTap;
  final Widget? placeHolder;

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) return SizedBox();
    return Stack(
      children: [
        ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.zero,
          child: CachedNetworkImage(
            alignment: alignment ?? Alignment.center,
            color: color,
            imageUrl: imageUrl,
            cacheKey: cacheKey,
            fit: boxFit,
            width: width,
            height: height,
            imageBuilder: imageBuilder,
            repeat: repeat,
            placeholder: (context, url) =>
                placeHolder ??
                AppShimmer(
                  width: width,
                  height: height,
                  borderRadius: borderRadius,
                ),
          ),
        ),
        if (onTap != null)
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(splashColor: AppColors.red.withOpacity(0.15), onTap: onTap),
            ),
          ),
      ],
    );
  }
}
