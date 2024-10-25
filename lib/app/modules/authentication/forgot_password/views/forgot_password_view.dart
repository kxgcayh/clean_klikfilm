import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_klikfilm/app/controllers/theming_controller.dart';
import 'package:fl_klikfilm/app/views/views/app_button_view.dart';
import 'package:fl_klikfilm/app/views/views/app_text_field_view.dart';
import 'package:fl_klikfilm/app/views/views/kf_app_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Get.find<ThemingController>();
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: KfAppBar(),
      body: Form(
        key: controller.formKey,
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
                            'Forgot Password',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: theme.primaryText,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Please enter your active email',
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
                    Column(
                      children: [
                        AppTextField(
                          label: 'Email',
                          hintText: 'example : email@klikfilm.com',
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.email(),
                            FormBuilderValidators.required(),
                          ]),
                        ),
                        SizedBox(height: 60),
                        AppButton(
                          text: 'Send Verification Code',
                          width: double.infinity,
                          onTap: () {
                            if (controller.formKey.currentState?.validate() ?? false) {
                              //
                            }
                          },
                        ),
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
