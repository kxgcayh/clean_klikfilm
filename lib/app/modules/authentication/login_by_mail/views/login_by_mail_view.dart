import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_klikfilm/app/controllers/theming_controller.dart';
import 'package:fl_klikfilm/app/data/app_colors.dart';
import 'package:fl_klikfilm/app/views/views/app_button_type.dart';
import 'package:fl_klikfilm/app/views/views/app_button_view.dart';
import 'package:fl_klikfilm/app/views/views/app_text_field_view.dart';
import 'package:fl_klikfilm/app/views/views/kf_app_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../controllers/login_by_mail_controller.dart';

class LoginByMailView extends GetView<LoginByMailController> {
  const LoginByMailView({super.key});
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
                        'Login with Email',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
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
                          text: 'Login',
                          width: double.infinity,
                          onTap: () {
                            if (controller.formKey.value.currentState?.validate() ?? false) {
                              // final authentication = ref.read(authenticationProvider);
                              // await authentication.loginByEmail(
                              //   ManualAuthFamily(
                              //     email: emailController.text,
                              //     password: passwordController.text,
                              //   ),
                              //   onValue: (result) async {
                              //     if (result.success) {
                              //       await ref.read(categoriesAsyncNotifier.notifier).forceRefresh().then((_) {
                              //         return HomeRoute().go(context);
                              //       });
                              //     } else {
                              //       await showDialog(
                              //         context: context,
                              //         barrierDismissible: true,
                              //         useRootNavigator: false,
                              //         builder: (BuildContext context) {
                              //           return KfAnimationDialog(
                              //             title: 'Login Failed',
                              //             message: result.desc ?? 'Something went wrong',
                              //             lottieAsset: Assets.animations.failBouncy,
                              //           );
                              //         },
                              //       );
                              //     }
                              //   },
                              // );
                            }
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 32),
                    AppButton(
                      text: 'Register',
                      onTap: () {},
                      buttonType: AppButtonType.link,
                    ),
                    SizedBox(height: 8),
                    AppButton(
                      text: 'Forgot Password',
                      onTap: () {},
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
