import 'package:fl_klikfilm/app/controllers/theming_controller.dart';
import 'package:fl_klikfilm/app/routes/app_pages.dart';
import 'package:fl_klikfilm/app/views/views/app_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class KfAppBar extends GetView<ThemingController> implements PreferredSizeWidget {
  final double? elevation;
  final String? title;
  final bool fillBackground;

  const KfAppBar({
    super.key,
    this.elevation,
    this.title,
    this.fillBackground = true,
  });

  @override
  Widget build(BuildContext context) {
    // final theme = Get.find<ThemingController>();

    return AppBar(
      elevation: elevation,
      backgroundColor: fillBackground ? controller.backgroundColor : Colors.transparent,
      surfaceTintColor: Colors.transparent,
      title: Builder(builder: (context) {
        if (title != null) {
          return Text(
            '$title',
            style: TextStyle(
              fontSize: 24,
              color: HexColor(controller.data.value.general.text.primary),
              fontWeight: FontWeight.w500,
            ),
          );
        }
        return Obx(
          () => AppImage(
            controller.canSurfaceView.value
                ? controller.data.value.general.logo.hd.top
                : controller.data.value.general.logo.sd.top,
            height: 40,
            boxFit: BoxFit.contain,
            placeHolder: SizedBox.shrink(),
          ),
        );
      }),
      centerTitle: true,
      flexibleSpace: Builder(
        builder: (context) {
          if (controller.data.value.pattern.topNav.isEmpty) return SizedBox.shrink();
          return AppImage(
            controller.data.value.pattern.topNav,
            boxFit: context.isTablet ? BoxFit.fitHeight : BoxFit.fill,
            height: double.infinity,
            repeat: context.isTablet ? ImageRepeat.repeatX : ImageRepeat.noRepeat,
          );
        },
      ),
      leading: Builder(builder: (context) {
        return IconButton(
          onPressed: () {
            if (Get.routing.current != Routes.HOME) {
              Get.back();
            } else {
              Get.toNamed(Routes.DRAWER_MENU);
            }
          },
          icon: Icon(
            Get.routing.current != Routes.HOME ? Icons.arrow_back_ios_new_rounded : Icons.menu_rounded,
            color: HexColor(controller.data.value.general.icon.color),
            size: 24,
          ),
        );
      }),
      actions: [
        if (Get.routing.current == Routes.HOME)
          IconButton(
            onPressed: () => Get.toNamed(Routes.SEARCH),
            icon: Icon(
              Icons.search_rounded,
              size: 28,
              color: HexColor(controller.data.value.general.icon.color),
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 1.05);
}
