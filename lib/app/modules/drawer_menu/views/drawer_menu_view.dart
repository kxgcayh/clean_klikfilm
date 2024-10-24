import 'dart:io';

import 'package:fl_klikfilm/app/controllers/local_user_controller.dart';
import 'package:fl_klikfilm/app/controllers/theming_controller.dart';
import 'package:fl_klikfilm/app/data/application_helper.dart';
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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              controller: controller.scrollController,
              child: Column(
                children: [
                  DrawerTileView(
                    onTap: () {},
                    leading: Assets.icons.home.svg(
                      colorFilter:
                          ColorFilter.mode(HexColor(theme.data.value.general.icon.color), BlendMode.srcIn),
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
                      // if ((local.isIndonesia || Platform.isAndroid) && local.isLogin)
                      //   asyncEventList.when(
                      //     data: (result) {
                      //       if (result.data.isEmpty) return SizedBox.shrink();
                      //       return ListView.builder(
                      //         shrinkWrap: true,
                      //         physics: NeverScrollableScrollPhysics(),
                      //         padding: EdgeInsets.zero,
                      //         itemCount: result.data.length,
                      //         itemBuilder: (context, index) {
                      //           final dataEvent = result.data[index];
                      //           return DrawerTileView(
                      //             leading: Image.asset(
                      //               Assets.images.logoEvent.path,
                      //               width: 22,
                      //               height: 22,
                      //               color: HexColor(theme.data.value.general.text.primary),
                      //             ),
                      //             title: dataEvent.title,
                      //             onTap: () async {
                      //               final targetUrl = dataEvent.dataExternal.target
                      //                   .substring(0, dataEvent.dataExternal.target.length - 1);
                      //               if (dataEvent.type == 1) {
                      //                 if (dataEvent.dataExternal.webview.flag == 1) {
                      //                   if (dataEvent.checkMembership == 1) {
                      //                     final cekMember =
                      //                         ref.read(userMembershipSourceProviderCek(local.userId!));
                      //                     cekMember.then((value) async {
                      //                       if (value['data']['status']['active'] == 1) {
                      //                         await Permission.camera.request();
                      //                         await Permission.microphone.request();
                      //                         Permission.camera.isGranted.then((value) {
                      //                           if (value == true) {
                      //                             Permission.microphone.isGranted.then((respon) {
                      //                               if (respon == true) {
                      //                                 context.pushNamed('inapp-webview-edufy', queryParameters: {
                      //                                   'url':
                      //                                       '$targetUrl?uid=${local.userId}&tok=${local.accessToken}',
                      //                                   // 'url':
                      //                                   //     '${dataEvent?.dataExternal?.target}?uid=${local.userId}&tok=${local.accessToken}',
                      //                                   'index': '$index',
                      //                                   'fullscreen':
                      //                                       '${dataEvent.dataExternal.webview.fullscreen}',
                      //                                   'defaultOrientation':
                      //                                       dataEvent.dataExternal.webview.defaultOrientation
                      //                                 });
                      //                               } else {
                      //                                 showDialog(
                      //                                     context: context,
                      //                                     barrierDismissible: true,
                      //                                     useRootNavigator: false,
                      //                                     builder: (BuildContext context) {
                      //                                       return DialogGeneralTwoButton(
                      //                                         text:
                      //                                             'Kamu harus izinkan permission kamera dan mikrophone',
                      //                                         ontapButton1: () async {
                      //                                           context.pop();
                      //                                           await openAppSettings();
                      //                                         },
                      //                                         ontapButton2: () => context.pop(),
                      //                                         textButton1: 'Open Setting',
                      //                                         textButton2: 'Tutup',
                      //                                       );
                      //                                     });
                      //                               }
                      //                             });
                      //                           } else {
                      //                             showDialog(
                      //                                 context: context,
                      //                                 barrierDismissible: true,
                      //                                 useRootNavigator: false,
                      //                                 builder: (BuildContext context) {
                      //                                   return DialogGeneralTwoButton(
                      //                                     text:
                      //                                         'Kamu harus izinkan permission kamera dan mikrophone',
                      //                                     ontapButton1: () async {
                      //                                       context.pop();
                      //                                       await openAppSettings();
                      //                                     },
                      //                                     ontapButton2: () => context.pop(),
                      //                                     textButton1: 'Open Setting',
                      //                                     textButton2: 'Tutup',
                      //                                   );
                      //                                 });
                      //                           }
                      //                         });
                      //                       } else {
                      //                         showDialog(
                      //                             context: context,
                      //                             barrierDismissible: true,
                      //                             builder: (BuildContext context) {
                      //                               return DialogGeneral(
                      //                                 text:
                      //                                     'Anda belum membeli paket atau berlangganan,\nsilahkan berlangganan',
                      //                                 ontap: () => context.pop(),
                      //                                 textButton: 'Tutup',
                      //                               );
                      //                             });
                      //                       }
                      //                     });
                      //                   } else {
                      //                     final cekMember =
                      //                         ref.watch(userMembershipSourceProviderCek(local.userId!));
                      //                     cekMember.then((value) async {
                      //                       if (value['data']['status']['active'] == 1) {
                      //                         await Permission.camera.request();
                      //                         await Permission.microphone.request();
                      //                         Permission.camera.isGranted.then((value) {
                      //                           if (value == true) {
                      //                             Permission.microphone.isGranted.then((respon) {
                      //                               if (respon == true) {
                      //                                 context.pushNamed('inapp-webview-edufy', queryParameters: {
                      //                                   'url':
                      //                                       '$targetUrl?uid=${local.userId}&tok=${local.accessToken}',
                      //                                   // 'url':
                      //                                   //     '${dataEvent?.dataExternal?.target}?uid=${local.userId}&tok=${local.accessToken}',
                      //                                   'index': '$index',
                      //                                   'fullscreen':
                      //                                       '${dataEvent.dataExternal.webview.fullscreen}',
                      //                                   'defaultOrientation':
                      //                                       dataEvent.dataExternal.webview.defaultOrientation
                      //                                 });
                      //                               } else {
                      //                                 showDialog(
                      //                                     context: context,
                      //                                     barrierDismissible: true,
                      //                                     useRootNavigator: false,
                      //                                     builder: (BuildContext context) {
                      //                                       return DialogGeneralTwoButton(
                      //                                         text:
                      //                                             'Kamu harus izinkan permission kamera dan mikrophone',
                      //                                         ontapButton1: () async {
                      //                                           context.pop();
                      //                                           await openAppSettings();
                      //                                         },
                      //                                         ontapButton2: () => context.pop(),
                      //                                         textButton1: 'Open Setting',
                      //                                         textButton2: 'Tutup',
                      //                                       );
                      //                                     });
                      //                               }
                      //                             });
                      //                           } else {
                      //                             showDialog(
                      //                                 context: context,
                      //                                 barrierDismissible: true,
                      //                                 useRootNavigator: false,
                      //                                 builder: (BuildContext context) {
                      //                                   return DialogGeneralTwoButton(
                      //                                     text:
                      //                                         'Kamu harus izinkan permission kamera dan mikrophone',
                      //                                     ontapButton1: () async {
                      //                                       context.pop();
                      //                                       await openAppSettings();
                      //                                     },
                      //                                     ontapButton2: () => context.pop(),
                      //                                     textButton1: 'Open Setting',
                      //                                     textButton2: 'Tutup',
                      //                                   );
                      //                                 });
                      //                           }
                      //                         });
                      //                       } else {
                      //                         showDialog(
                      //                             context: context,
                      //                             barrierDismissible: true,
                      //                             builder: (BuildContext context) {
                      //                               return DialogGeneral(
                      //                                 text:
                      //                                     'Anda belum membeli paket atau berlangganan,\nsilahkan berlangganan',
                      //                                 ontap: () => context.pop(),
                      //                                 textButton: 'Tutup',
                      //                               );
                      //                             });
                      //                       }
                      //                     });
                      //                   }
                      //                 } else {
                      //                   launchUrl(
                      //                       Uri.parse(
                      //                           '${dataEvent.dataExternal.target}?uid=${local.userId}&tok=${local.accessToken}'),
                      //                       mode: LaunchMode.externalApplication);
                      //                 }
                      //               } else {
                      //                 context.pushNamed(
                      //                   'minisite-detail',
                      //                   queryParameters: {'id': ''},
                      //                 );
                      //               }
                      //             },
                      //           );
                      //         },
                      //       );
                      //     },
                      //     error: (error, stack) => SizedBox.shrink(),
                      //     loading: () => SizedBox.shrink(),
                      //   ),

                      if ((local.isIndonesia || Platform.isAndroid) && local.isLogin)
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
                      // if (local.isIndonesia && local.isLogin)
                      //   DrawerTileView(
                      //     title: 'Downloads',
                      //     leading: Assets.images.download.svg(
                      //       fit: BoxFit.fill,
                      //       colorFilter: ColorFilter.mode(
                      //         HexColor(theme.data.value.general.icon.color),
                      //         BlendMode.srcIn,
                      //       ),
                      //     ),
                      //     onTap: () => context.pushReplacementNamed('offline-video'),
                      //   ),
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
            title: 'LOGOUT',
          ),
        ],
      ),
    );
  }
}
