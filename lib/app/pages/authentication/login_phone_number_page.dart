import 'package:fl_klikfilm/app/routes/app_router.dart';
import 'package:fl_klikfilm/app/styles/kfilm_colors.dart';
import 'package:fl_klikfilm/app/widgets/kf_app_bar.dart';
import 'package:fl_klikfilm/app/widgets/kf_dialog.dart';
import 'package:fl_klikfilm/app/widgets/kf_text_field.dart';
import 'package:fl_klikfilm/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';

class LoginPhoneNumberPage extends HookConsumerWidget {
  const LoginPhoneNumberPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useState(GlobalKey<FormState>());
    final phoneController = useTextEditingController();

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
                    child: Column(
                      children: [
                        Text(
                          'Login with',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Phone Number',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 80),
                  Column(
                    children: [
                      Text(
                        'Please enter your phone number.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: 24),
                      KfTextField(
                        label: 'Phone Number',
                        showLabel: false,
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.numeric(),
                          FormBuilderValidators.min(11),
                          FormBuilderValidators.required(),
                        ]),
                        prefixIcon: Container(
                          width: 24,
                          height: 24,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '+62',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 2),
                                child: Container(width: 2, height: 23, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 60),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (formKey.value.currentState?.validate() ?? false) {
                              final passVmKey = await ref.read(passVmKeyProvider(phoneController.text));
                              await ref.read(pushOtpProvider(passVmKey.result.msisdn)).then((result) async {
                                if (result.status?.sessionId != null) {
                                  PhoneOtpRoute(
                                    sessionId: '${result.status?.sessionId}',
                                    phoneNumber: passVmKey.result.msisdn,
                                  ).push(context);
                                } else {
                                  await showDialog(
                                    context: context,
                                    barrierDismissible: true,
                                    useRootNavigator: false,
                                    builder: (BuildContext context) {
                                      return KfDialog(
                                        title: 'Anda belum berlangganan KlikFilm',
                                        message: 'Hubungi *500*60# untuk berlangganan',
                                        lottieAsset: Assets.animations.failBouncy,
                                      );
                                    },
                                  ).then((_) => context.pop());
                                }
                              });
                            }
                          },
                          child: Text('Send Code'),
                        ),
                      ),
                    ],
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
