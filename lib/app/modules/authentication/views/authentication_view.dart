import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_klikfilm/app/controllers/theming_controller.dart';
import 'package:fl_klikfilm/app/routes/app_pages.dart';
import 'package:fl_klikfilm/app/views/views/app_button_view.dart';
import 'package:fl_klikfilm/app/views/views/kf_app_bar_view.dart';
import 'package:fl_klikfilm/gen/assets.gen.dart';
import 'package:fl_klikfilm/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../controllers/authentication_controller.dart';

class AuthenticationView extends GetView<AuthenticationController> {
  const AuthenticationView({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Get.find<ThemingController>();

    return Scaffold(
      appBar: KfAppBar(),
      backgroundColor: theme.backgroundColor,
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
        padding: EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (Platform.isIOS)
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: AppButton(
                  width: double.infinity,
                  text: 'Sign in with Apple ID',
                  fontSize: context.width > 450 ? 20 : 15,
                  fontFamily: FontFamily.nunito,
                  prefix: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Assets.icons.apple.image(
                      width: 24,
                      height: 24,
                      color: HexColor(theme.data.value.buttons.login.text),
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                  onTap: () {},
                ),
              ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: AppButton(
                width: double.infinity,
                text: 'Sign in with Google',
                fontSize: context.width > 450 ? 20 : 15,
                fontFamily: FontFamily.nunito,
                prefix: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Assets.icons.google.svg(
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      HexColor(theme.data.value.buttons.login.text),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                onTap: () {},
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: AppButton(
                width: double.infinity,
                text: 'Sign in with Email',
                fontSize: context.width > 450 ? 20 : 15,
                fontFamily: FontFamily.nunito,
                prefix: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Assets.icons.email.svg(
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      HexColor(theme.data.value.buttons.login.text),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                onTap: () => Get.toNamed(Routes.LOGIN_BY_MAIL),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: AppButton(
                width: double.infinity,
                text: 'Sign in with Phone Number',
                fontSize: context.width > 450 ? 20 : 15,
                fontFamily: FontFamily.nunito,
                prefix: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Assets.icons.phone.svg(
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      HexColor(theme.data.value.buttons.login.text),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                onTap: () => Get.toNamed(Routes.LOGIN_BY_PHONE),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
