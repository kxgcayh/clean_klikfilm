import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_klikfilm/app/styles/kfilm_colors.dart';
import 'package:fl_klikfilm/app/widgets/kf_shimmer.dart';
import 'package:flutter/material.dart';

class KFImage extends StatelessWidget {
  const KFImage(
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
    this.onTap,
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
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
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
            placeholder: (context, url) => KfShimmer(
              width: width,
              height: height,
              borderRadius: borderRadius,
            ),
            // errorWidget: (context, url, error) =>
            //     errorWidget ??
            //     DefaultErrorWidget(
            //       width: width,
            //       height: height,
            //     ),
          ),
        ),
        if (onTap != null)
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(splashColor: KColors.red.withOpacity(0.15), onTap: onTap),
            ),
          ),
      ],
    );
  }
}
