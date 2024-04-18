import 'package:fl_klikfilm/app/styles/kfilm_colors.dart';
import 'package:fl_klikfilm/app/widgets/kf_app_bar.dart';
import 'package:fl_klikfilm/app/widgets/kf_text_field.dart';
import 'package:fl_klikfilm/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class ForgotPasswordPage extends HookWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                    child: Column(
                      children: [
                        Text(
                          'Forgot Password',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Please enter your active email',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 80),
                  Column(
                    children: [
                      KfTextField(
                        label: 'Email',
                        hintText: 'example : email@klikfilm.com',
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.email(),
                          FormBuilderValidators.required(),
                        ]),
                      ),
                      SizedBox(height: 60),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.value.currentState?.validate() ?? false) {
                              //
                            }
                          },
                          child: Text('Send Verification Code'),
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
