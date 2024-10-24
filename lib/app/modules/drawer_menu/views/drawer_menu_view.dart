import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_klikfilm/app/controllers/local_user_controller.dart';
import 'package:fl_klikfilm/app/controllers/theming_controller.dart';
import 'package:fl_klikfilm/app/data/application_helper.dart';
import 'package:fl_klikfilm/app/modules/drawer_menu/controllers/drawer_event_menu_controller.dart';
import 'package:fl_klikfilm/app/modules/drawer_menu/controllers/drawer_menu_controller.dart';
import 'package:fl_klikfilm/app/modules/drawer_menu/views/drawer_tile_view.dart';
import 'package:fl_klikfilm/app/views/views/kf_app_bar_view.dart';
import 'package:fl_klikfilm/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class DrawerMenuView extends GetView<DrawerMenuController> {
  DrawerMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final local = Get.find<LocalUserController>();
    final theme = Get.find<ThemingController>();

    return Scaffold(
      appBar: KfAppBar(fillBackground: false),
      backgroundColor: HexColor(theme.data.value.general.background.color),
      body: Container(
        width: double.infinity,
        height: context.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(theme.data.value.pattern.bottom),
            repeat: context.isTablet ? ImageRepeat.repeatX : ImageRepeat.noRepeat,
            fit: context.isTablet ? BoxFit.fitHeight : BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                controller: controller.scrollController,
                child: Column(
                  children: [
                    DrawerTileView(
                      onTap: () => Get.back(),
                      leading: Assets.icons.home.svg(
                        colorFilter: ColorFilter.mode(
                          HexColor(theme.data.value.general.icon.color),
                          BlendMode.srcIn,
                        ),
                      ),
                      title: 'HOME',
                    ),
                    Column(
                      children: [
                        if (local.isLogin)
                          DrawerTileView(
                            title: 'My Account',
                            leading: Icon(
                              Icons.account_circle_rounded,
                              color: HexColor(theme.data.value.general.text.primary),
                              size: 25,
                            ),
                            onTap: () {},
                          ),
                        if ((local.isIndonesia || Platform.isAndroid) && local.isLogin)
                          DrawerTileView(
                            title: 'Points',
                            leading: Assets.icons.points.svg(
                              fit: BoxFit.fill,
                              colorFilter: ColorFilter.mode(
                                HexColor(theme.data.value.general.icon.color),
                                BlendMode.srcIn,
                              ),
                            ),
                            onTap: () {},
                          ),
                        if (local.isIndonesia || Platform.isAndroid) // && local.isLogin
                          GetBuilder(
                            init: DrawerEventMenuController(),
                            builder: (controller) {
                              if (controller.state == null) return SizedBox.shrink();
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                itemCount: controller.state?.length ?? 0,
                                itemBuilder: (context, index) {
                                  final dataEvent = controller.state![index];
                                  return DrawerTileView(
                                    leading: Assets.icons.movieTicket.svg(
                                      colorFilter: ColorFilter.mode(
                                        HexColor(theme.data.value.general.icon.color),
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    title: dataEvent.title,
                                    onTap: () {},
                                  );
                                },
                              );
                            },
                          ),

                        if (local.isIndonesia || Platform.isAndroid) // && local.isLogin
                          DrawerTileView(
                            title: 'KlikFilm Arcade',
                            leading: Icon(
                              Icons.videogame_asset,
                              color: HexColor(theme.data.value.general.text.primary),
                              size: 25,
                            ),
                            onTap: () async {
                              //
                            },
                          ),
                        if (local.isIndonesia) // && local.isLogin
                          DrawerTileView(
                            title: 'Downloads',
                            leading: Assets.icons.download.svg(
                              fit: BoxFit.fill,
                              colorFilter: ColorFilter.mode(
                                HexColor(theme.data.value.general.icon.color),
                                BlendMode.srcIn,
                              ),
                            ),
                            onTap: () {},
                          ),
                        if (local.isIndonesia)
                          DrawerTileView(
                            title: 'Rewards',
                            leading: Assets.icons.rewards.svg(
                              fit: BoxFit.fill,
                              colorFilter: ColorFilter.mode(
                                HexColor(theme.data.value.general.icon.color),
                                BlendMode.srcIn,
                              ),
                            ),
                            onTap: () {},
                          ),
                        if (local.isLogin)
                          DrawerTileView(
                            title: 'Link to TV',
                            leading: Assets.icons.tv.svg(
                              fit: BoxFit.fill,
                              colorFilter: ColorFilter.mode(
                                HexColor(theme.data.value.general.icon.color),
                                BlendMode.srcIn,
                              ),
                            ),
                            onTap: () {},
                          ),
                        // if ((local.isIndonesia || Platform.isAndroid) && local.isLogin)
                        //   DrawerTileView(
                        //     title: 'Redeem Voucher',
                        //     leading: Assets.images.logoEvent.image(
                        //       fit: BoxFit.fill,
                        //       color: HexColor(theme.data.value.general.icon.color),
                        //     ),
                        //     onTap: () => context.pushReplacementNamed('redeem-voucher'),
                        //   ),
                        if (local.isLogin)
                          DrawerTileView(
                            title: 'Kids Mode',
                            leading: Assets.icons.kids.svg(
                              fit: BoxFit.fill,
                              colorFilter: ColorFilter.mode(
                                HexColor(theme.data.value.general.icon.color),
                                BlendMode.srcIn,
                              ),
                            ),
                            action: Stack(
                              alignment: local.common.value.kidsMode.isNotEmpty
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              children: [
                                Container(
                                  width: context.isTablet ? 40 : 45,
                                  height: 18,
                                  decoration: BoxDecoration(
                                    color: HexColor(
                                      local.common.value.kidsMode.isNotEmpty
                                          ? theme.data.value.buttons.kidsmode.active.background.color
                                          : theme.data.value.buttons.kidsmode.inactive.background.color,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: HexColor(
                                      local.common.value.kidsMode.isNotEmpty
                                          ? theme.data.value.buttons.kidsmode.active.slider
                                          : theme.data.value.buttons.kidsmode.inactive.slider,
                                    ),
                                    borderRadius: BorderRadius.circular(20 / 2),
                                  ),
                                )
                              ],
                            ),
                            onTap: () {
                              if (local.common.value.kidsMode.isNotEmpty) {
                                //
                              } else {
                                //
                              }
                            },
                          ),
                      ],
                    ),
                    if (local.isIndonesia)
                      Obx(
                        () => DrawerTileView(
                          title: 'Support',
                          leading: Assets.icons.support.svg(
                            fit: BoxFit.fill,
                            colorFilter: ColorFilter.mode(
                              HexColor(theme.data.value.general.icon.color),
                              BlendMode.srcIn,
                            ),
                          ),
                          action: Icon(
                            controller.supportExpanded.value
                                ? Icons.keyboard_arrow_up_rounded
                                : Icons.keyboard_arrow_down_rounded,
                            color: HexColor(theme.data.value.general.text.primary),
                          ),
                          onTap: () async {
                            controller.toggleSupport();
                            await Future.delayed(150.milliseconds);
                            controller.scrollController.animateTo(
                              controller.supportExpanded.value ? controller.scrollController.maxOffset : 0,
                              duration: 200.milliseconds,
                              curve: Curves.easeIn,
                            );
                          },
                          child: controller.supportExpanded.value
                              ? Column(
                                  children: [
                                    DrawerTileView(
                                      title: 'Contact Us',
                                      leading: SizedBox(width: 22),
                                      onTap: () {},
                                    ),
                                    DrawerTileView(
                                      leading: SizedBox(width: 22),
                                      title: 'Terms of Use',
                                      onTap: () {},
                                    ),
                                    if (local.isIndonesia || Platform.isAndroid)
                                      DrawerTileView(
                                        leading: SizedBox(width: 22),
                                        title: 'FAQ',
                                        onTap: () {},
                                      ),
                                    DrawerTileView(
                                      leading: SizedBox(width: 22),
                                      title: 'Privacy Policy',
                                      onTap: () {},
                                    ),
                                  ],
                                )
                              : null,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            DrawerTileView(
              onTap: () {},
              leading: Assets.icons.logout.svg(
                colorFilter: ColorFilter.mode(HexColor(theme.data.value.general.icon.color), BlendMode.srcIn),
              ),
              title: local.isLogin ? 'LOGOUT' : 'LOGIN',
            ),
          ],
        ),
      ),
    );
  }
}
