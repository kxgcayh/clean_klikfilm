import 'package:fl_klikfilm/app/styles/kfilm_colors.dart';
import 'package:fl_klikfilm/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class KfDialog extends StatelessWidget {
  final String? title;
  final String subTitle;
  final String? description;
  final String? confirmText;
  final void Function()? onConfirm;
  final void Function()? onCancel;

  const KfDialog({
    super.key,
    this.title,
    required this.subTitle,
    this.description,
    this.confirmText,
    this.onConfirm,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      surfaceTintColor: Colors.transparent,
      backgroundColor: KColors.primaryGrey.withOpacity(0.95),
      title: title != null
          ? Text(title!, textAlign: TextAlign.center)
          : Assets.pictures.logo.image(width: 134, height: 26),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                subTitle,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
              ),
              if (description != null)
                Text(
                  description!,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
            ],
          ),
          SizedBox(height: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (onConfirm != null)
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: onConfirm,
                    style: TextButton.styleFrom(
                      backgroundColor: KColors.darkRed,
                      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      padding: EdgeInsets.zero,
                    ),
                    child: Text(confirmText ?? 'Okay'),
                  ),
                ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: onCancel ?? () => context.pop(),
                  style: TextButton.styleFrom(
                    backgroundColor: KColors.grey,
                    textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  child: Text('Cancel'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
