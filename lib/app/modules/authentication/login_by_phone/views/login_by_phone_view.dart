import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_klikfilm/app/controllers/theming_controller.dart';
import 'package:fl_klikfilm/app/views/views/app_button_type.dart';
import 'package:fl_klikfilm/app/views/views/app_button_view.dart';
import 'package:fl_klikfilm/app/views/views/app_text_field_view.dart';
import 'package:fl_klikfilm/app/views/views/kf_app_bar_view.dart';
import 'package:fl_klikfilm/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../controllers/login_by_phone_controller.dart';

class LoginByPhoneView extends GetView<LoginByPhoneController> {
  const LoginByPhoneView({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Get.find<ThemingController>();

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: KfAppBar(),
      body: Form(
        // key: formKey.value,
        child: SingleChildScrollView(
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
                            'Login with',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: theme.primaryText,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Phone Number',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: theme.primaryText,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 80),
                    Column(
                      children: [
                        Text(
                          'Please enter your phone number',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: theme.primaryText,
                          ),
                        ),
                        SizedBox(height: 24),
                        AppTextField(
                          label: 'Phone Number',
                          showLabel: false,
                          controller: controller.phoneController,
                          keyboardType: TextInputType.phone,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.numeric(),
                            FormBuilderValidators.min(11),
                            FormBuilderValidators.required(),
                          ]),
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              padding: EdgeInsets.symmetric(horizontal: 6),
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                    color: HexColor(theme.data.value.textbox.general.text),
                                    width: 2,
                                  ),
                                ),
                              ),
                              child: Assets.icons.prefixIndo.svg(
                                width: 21,
                                height: 21,
                                fit: BoxFit.scaleDown,
                                colorFilter: ColorFilter.mode(
                                  HexColor(theme.data.value.textbox.general.text),
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 60),
                        AppButton(
                          text: 'Send Code',
                          width: double.infinity,
                          onTap: () {},
                        ),
                        SizedBox(height: 116),
                        Text(
                          'By Clicking start, you agree to our',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: theme.primaryText,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppButton(
                              text: 'Privacy Policy',
                              buttonType: AppButtonType.link,
                              contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                              color: theme.primaryText,
                              onTap: () {},
                            ),
                            Text(
                              'and',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: theme.primaryText,
                              ),
                            ),
                            AppButton(
                              text: 'Terms & Conditions',
                              contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                              buttonType: AppButtonType.link,
                              color: theme.primaryText,
                              onTap: () {},
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
