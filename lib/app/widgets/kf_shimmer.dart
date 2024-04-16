import 'package:fl_klikfilm/app/styles/kfilm_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class KfShimmer extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? baseColor;
  final Color? highlightColor;
  final BorderRadius? borderRadius;

  const KfShimmer({
    super.key,
    this.width,
    this.height,
    this.baseColor,
    this.highlightColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(borderRadius: borderRadius),
      child: Shimmer.fromColors(
        baseColor: baseColor ?? KColors.primaryGrey,
        highlightColor: highlightColor ?? Colors.white,
        period: Duration(milliseconds: 1200),
        child: LayoutBuilder(builder: (context, constraints) {
          return Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            decoration: BoxDecoration(color: KColors.grey, borderRadius: borderRadius),
          );
        }),
      ),
    );
  }
}
