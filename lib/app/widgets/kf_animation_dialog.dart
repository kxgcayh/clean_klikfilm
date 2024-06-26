import 'package:fl_klikfilm/app/styles/kfilm_colors.dart';
import 'package:fl_klikfilm/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class KfAnimationDialog extends StatelessWidget {
  final String title;
  final String lottieAsset;
  final String? message;

  const KfAnimationDialog({
    super.key,
    required this.title,
    required this.lottieAsset,
    this.message,
  });

  KfAnimationDialog.success({
    super.key,
    this.message,
  })  : title = 'Success',
        lottieAsset = Assets.animations.success;

  KfAnimationDialog.error({
    super.key,
    this.message,
  })  : title = 'Error',
        lottieAsset = Assets.animations.failBouncy;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.center,
      backgroundColor: Colors.transparent,
      surfaceTintColor: KColors.primaryGrey.withOpacity(0.95),
      child: Container(
        decoration: BoxDecoration(
          color: KColors.primaryGrey.withOpacity(0.95),
          borderRadius: BorderRadius.circular(18),
        ),
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height / 2.8,
        ),
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset(
              lottieAsset,
              width: 150,
              height: 150,
            ),
            SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 22,
              ),
            ),
            if (message != null)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  message!,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
