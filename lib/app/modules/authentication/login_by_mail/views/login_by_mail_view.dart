import 'package:fl_klikfilm/app/data/app_colors.dart';
import 'package:fl_klikfilm/app/views/views/app_text_field_view.dart';
import 'package:fl_klikfilm/app/views/views/kf_app_bar_view.dart';
import 'package:fl_klikfilm/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';

import '../controllers/login_by_mail_controller.dart';

class LoginByMailView extends GetView<LoginByMailController> {
  const LoginByMailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: AppColors.darkGrey,
        image: DecorationImage(
          alignment: Alignment.centerLeft,
          image: AssetImage(Assets.pictures.batikDrawer.path),
          fit: BoxFit.fitHeight,
          repeat: ImageRepeat.repeatY,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: KfAppBar(),
        body: Form(
          key: controller.formKey.value,
          child: SingleChildScrollView(
            child: Padding(
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
                        label: 'KlikFilm Account',
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
                      AppTextField(
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
                            onTap: () =>
                                controller.isObscurePassword.value = !controller.isObscurePassword.value,
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
                      SizedBox(height: 28),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
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
                          child: Text('Login'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.025),
                    ),
                    onPressed: () {},
                    child: Text('Register'),
                  ),
                  SizedBox(height: 8),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.025),
                    ),
                    onPressed: () {},
                    child: Text('Forgot Password'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
