import 'package:fl_klikfilm/app/routes/app_router.dart';
import 'package:fl_klikfilm/app/styles/kfilm_colors.dart';
import 'package:fl_klikfilm/app/widgets/kf_animation_dialog.dart';
import 'package:fl_klikfilm/app/widgets/kf_app_bar.dart';
import 'package:fl_klikfilm/app/widgets/kf_text_field.dart';
import 'package:fl_klikfilm/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';

class RegisterMailPage extends HookConsumerWidget {
  const RegisterMailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isObscurePassword = useState<bool>(true);
    final formKey = useState(GlobalKey<FormState>());
    final txtMail = useTextEditingController();
    final txtPassword = useTextEditingController();

    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: KColors.darkGrey,
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
          key: formKey.value,
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
                      'Register',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(height: 80),
                  Column(
                    children: [
                      KfTextField(
                        label: 'Email',
                        hintText: 'example : email@klikfilm.com',
                        controller: txtMail,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.email(),
                          FormBuilderValidators.required(),
                        ]),
                      ),
                      SizedBox(height: 20),
                      KfTextField(
                        label: 'Password',
                        hintText: '************',
                        controller: txtPassword,
                        obscureText: isObscurePassword.value,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.min(4),
                          FormBuilderValidators.required(),
                        ]),
                        suffixIcon: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width),
                          child: InkWell(
                            onTap: () => isObscurePassword.value = !isObscurePassword.value,
                            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width),
                            child: Icon(Icons.remove_red_eye, color: Colors.black),
                          ),
                        ),
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: KColors.silverSand,
                          letterSpacing: 6,
                        ),
                      ),
                      SizedBox(height: 60),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            final local = ref.watch(userAuthDataNotifier);
                            final authentication = ref.read(authenticationProvider);
                            final ManualAuthFamily arg = ManualAuthFamily(
                              email: txtMail.text,
                              password: txtPassword.text,
                            );
                            if (formKey.value.currentState?.validate() ?? false) {
                              await authentication.registerByEmail(arg, onValue: (response) async {
                                if (response.data?.id != null) {
                                  VerificationMailRoute(
                                    email: txtMail.text,
                                    registrationId: response.data!.id,
                                  ).push(context);
                                }
                                if (!response.success && local.registrationId.isNotEmpty) {
                                  await ref
                                      .read(resendRegisterActivationProvider)
                                      .then((value) => VerificationMailRoute(
                                            email: txtMail.text,
                                            registrationId: local.registrationId,
                                          ).push(context));
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (context) {
                                      return KfAnimationDialog.error(
                                        message: response.desc ?? 'Something went wrong',
                                      );
                                    },
                                  );
                                }
                              });
                            }
                          },
                          child: Text('Register'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Sudah punya akun?',
                    style: TextStyle(fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () => context.pop(),
                    child: Text(
                      'Login di sini',
                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18),
                    ),
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
