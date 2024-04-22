import 'package:fl_klikfilm/app/routes/app_router.dart';
import 'package:fl_klikfilm/app/styles/kfilm_colors.dart';
import 'package:fl_klikfilm/app/widgets/kf_app_bar.dart';
import 'package:fl_klikfilm/app/widgets/kf_text_field.dart';
import 'package:fl_klikfilm/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';

class LoginMailPage extends HookConsumerWidget {
  const LoginMailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isObscurePassword = useState<bool>(true);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final formKey = useState(GlobalKey<FormState>());

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
                      'Login with Email',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(height: 80),
                  Column(
                    children: [
                      KfTextField(
                        label: 'KlikFilm Account',
                        hintText: 'example : email@klikfilm.com',
                        controller: emailController,
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
                      KfTextField(
                        label: 'Password',
                        hintText: '************',
                        controller: passwordController,
                        obscureText: isObscurePassword.value,
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
                            onTap: () => isObscurePassword.value = !isObscurePassword.value,
                            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width),
                            child: Icon(
                                !isObscurePassword.value
                                    ? Icons.visibility_rounded
                                    : Icons.visibility_off_rounded,
                                color: Colors.black),
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
                            if (formKey.value.currentState?.validate() ?? false) {
                              final ManualLoginFamily loginArg = ManualLoginFamily(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                              final local = ref.watch(localUserNotifierProvider);
                              await ref.read(manualLoginProvider(loginArg)).then((response) async {
                                if (response.success) {
                                  if (local.msisdn != null) {
                                    await ref.read(msisdnPairingProvider(MsisdnPairingFamily(
                                      uid: '${response.data?.id}',
                                      msisdn: '${local.msisdn}',
                                    )));
                                  }
                                  await ref
                                      .read(localUserNotifierProvider.notifier)
                                      .setLogin(AuthenticationType.email)
                                      .then((_) => HomeRoute().go(context));
                                }
                              });
                            }
                          },
                          child: Text('Login'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  TextButton(
                    onPressed: () => RegisterMailRoute().push(context),
                    child: Text('Register'),
                  ),
                  TextButton(
                    onPressed: () => ForgotPasswordRoute().push(context),
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
