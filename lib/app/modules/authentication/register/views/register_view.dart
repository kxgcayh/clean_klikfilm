import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_klikfilm/app/controllers/theming_controller.dart';
import 'package:fl_klikfilm/app/data/app_colors.dart';
import 'package:fl_klikfilm/app/modules/authentication/register/controllers/register_controller.dart';
import 'package:fl_klikfilm/app/views/views/app_button_type.dart';
import 'package:fl_klikfilm/app/views/views/app_button_view.dart';
import 'package:fl_klikfilm/app/views/views/app_text_field_view.dart';
import 'package:fl_klikfilm/app/views/views/kf_app_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Get.find<ThemingController>();
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: KfAppBar(),
      resizeToAvoidBottomInset: true,
      body: Form(
        key: controller.formKey.value,
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
                      child: Text(
                        'Register KlikFilm Account',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: theme.primaryText,
                        ),
                      ),
                    ),
                    SizedBox(height: 80),
                    Column(
                      children: [
                        AppTextField(
                          label: 'Email',
                          hintText: 'example : email@klikfilm.com',
                          controller: controller.emailController,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.email(
                              errorText: 'Alamat Email Tidak Valid',
                            ),
                            FormBuilderValidators.required(
                              errorText: 'Email Tidak Boleh Kosong',
                            ),
                          ]),
                        ),
                        SizedBox(height: 20),
                        Obx(
                          () => AppTextField(
                            label: 'Password',
                            hintText: '************',
                            controller: controller.passwordController,
                            obscureText: controller.isObscurePassword.value,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                errorText: 'Password Tidak Boleh Kosong',
                              ),
                              FormBuilderValidators.minLength(
                                6,
                                errorText: 'Password Tidak Boleh Kurang dari 6',
                              ),
                            ]),
                            suffixIcon: Material(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width),
                              child: InkWell(
                                onTap: () {
                                  controller.isObscurePassword.value = !controller.isObscurePassword.value;
                                },
                                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width),
                                child: Icon(
                                    !controller.isObscurePassword.value
                                        ? Icons.visibility_rounded
                                        : Icons.visibility_off_rounded,
                                    color: Colors.black),
                              ),
                            ),
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: AppColors.silverSand,
                              letterSpacing: 6,
                            ),
                          ),
                        ),
                        SizedBox(height: 28),
                        AppButton(
                          text: 'Register',
                          width: double.infinity,
                          onTap: () {
                            if (controller.formKey.value.currentState?.validate() ?? false) {
                              //
                            }
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 32),
                    Text(
                      'Sudah punya akun?',
                      style: TextStyle(
                        fontSize: 16,
                        color: theme.primaryText,
                      ),
                    ),
                    SizedBox(height: 8),
                    AppButton(
                      text: 'Login di sini',
                      onTap: () => Get.back(),
                      buttonType: AppButtonType.link,
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
