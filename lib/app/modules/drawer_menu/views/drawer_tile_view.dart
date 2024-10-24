import 'package:fl_klikfilm/app/controllers/theming_controller.dart';
import 'package:fl_klikfilm/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class DrawerTileView extends GetView {
  final String title;
  final Widget? action;
  final Widget? child;
  final Widget leading;
  final void Function()? onTap;

  const DrawerTileView({
    this.action,
    this.child,
    required this.leading,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Get.find<ThemingController>();
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 18),
            child: Row(
              children: [
                SizedBox(width: 22, height: 22, child: leading),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: Text(
                      title.toUpperCase(),
                      style: TextStyle(
                        color: HexColor(theme.data.value.general.text.primary),
                        fontSize: context.isTablet ? 20 : 16,
                        fontFamily: FontFamily.nunito,
                      ),
                    ),
                  ),
                ),
                if (action != null) action!,
              ],
            ),
          ),
        ),
        if (child != null) child!,
      ],
    );
  }
}
