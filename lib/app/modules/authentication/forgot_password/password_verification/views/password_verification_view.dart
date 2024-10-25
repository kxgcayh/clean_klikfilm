import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_klikfilm/app/controllers/theming_controller.dart';
import 'package:fl_klikfilm/app/routes/app_pages.dart';
import 'package:fl_klikfilm/app/views/views/app_button_view.dart';
import 'package:fl_klikfilm/app/views/views/kf_app_bar_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pinput/pinput.dart';

import '../controllers/password_verification_controller.dart';

class PasswordVerificationView extends GetView<PasswordVerificationController> {
  const PasswordVerificationView({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Get.find<ThemingController>();

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: KfAppBar(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: context.width,
              height: context.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(theme.data.value.pattern.bottom),
                  repeat: context.isTablet ? ImageRepeat.repeatX : ImageRepeat.noRepeat,
                  fit: context.isTablet ? BoxFit.fitHeight : BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 7),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Verification',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            color: theme.primaryText,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Enter 6 digit code we sent to your email',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: theme.primaryText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 80),
                  Pinput(
                    length: 6,
                    // controller: pinController,
                    hapticFeedbackType: HapticFeedbackType.lightImpact,
                    keyboardType: TextInputType.text,
                    defaultPinTheme: PinTheme(
                      width: 50,
                      height: 50,
                      textStyle: TextStyle(
                        fontSize: 28,
                        color: HexColor(theme.data.value.textbox.general.text),
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: BoxDecoration(
                        color: HexColor(theme.data.value.textbox.general.background.color),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    focusedPinTheme: PinTheme(
                      width: 54,
                      height: 54,
                      textStyle: TextStyle(
                        fontSize: 28,
                        color: HexColor(theme.data.value.textbox.general.text),
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: BoxDecoration(
                        color: HexColor(theme.data.value.textbox.general.placeholder),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: HexColor(theme.data.value.textbox.general.text),
                        ),
                      ),
                    ),
                    showCursor: true,
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  ),
                  SizedBox(height: 60),
                  AppButton(
                    text: 'Verify',
                    width: double.infinity,
                    onTap: () {
                      Get.offNamed(Routes.HOME);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
