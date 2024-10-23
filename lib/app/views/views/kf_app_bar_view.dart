import 'package:fl_klikfilm/app/controllers/local_user_controller.dart';
import 'package:fl_klikfilm/app/controllers/theming_controller.dart';
import 'package:fl_klikfilm/app/routes/app_pages.dart';
import 'package:fl_klikfilm/app/views/views/app_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class KfAppBar extends GetView implements PreferredSizeWidget {
  final double? elevation;
  final String? title;

  const KfAppBar({
    super.key,
    this.elevation,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final local = Get.find<LocalUserController>();
    final theme = Get.find<ThemingController>();
    return Obx(
      () => AppBar(
        elevation: elevation,
        backgroundColor: HexColor('${theme.data.value.general.background.color}'),
        surfaceTintColor: Colors.transparent,
        title: Builder(builder: (context) {
          if (title != null) {
            return Text(
              '$title',
              style: TextStyle(
                fontSize: 24,
                color: HexColor(theme.data.value.general.text.primary),
                fontWeight: FontWeight.w500,
              ),
            );
          }
          return AppImage(
            local.canSurfaceView.value
                ? theme.data.value.general.logo.hd.top
                : theme.data.value.general.logo.sd.top,
            height: 40,
            boxFit: BoxFit.contain,
            placeHolder: SizedBox.shrink(),
          );
        }),
        centerTitle: true,
        flexibleSpace: Builder(
          builder: (context) {
            if (theme.data.value.pattern.topNav.isEmpty) return SizedBox.shrink();
            return AppImage(
              theme.data.value.pattern.topNav,
              boxFit: context.isTablet ? BoxFit.fitHeight : BoxFit.fill,
              height: double.infinity,
              repeat: context.isTablet ? ImageRepeat.repeatX : ImageRepeat.noRepeat,
            );
          },
        ),
        leading: IconButton(
          onPressed: () {
            if (Get.routing.current != Routes.HOME) {
              Get.offNamed(Routes.HOME);
            } else {
              Get.toNamed(Routes.DRAWER_MENU);
            }
          },
          icon: Builder(builder: (context) {
            return Icon(
              Get.routing.current != Routes.HOME ? Icons.arrow_back_ios_new_rounded : Icons.menu_rounded,
              color: HexColor(theme.data.value.general.icon.color),
              size: 24,
            );
          }),
        ),
        actions: [
          if (Get.routing.current == Routes.HOME)
            IconButton(
              onPressed: () => Get.toNamed(Routes.SEARCH),
              icon: Icon(
                Icons.search_rounded,
                size: 28,
                color: HexColor(theme.data.value.general.icon.color),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 1.05);
}
