import 'package:fl_klikfilm/app/providers/categories/categories_provider.dart';
import 'package:fl_klikfilm/app/routes/app_router.dart';
import 'package:fl_klikfilm/app/styles/kfilm_colors.dart';
import 'package:fl_klikfilm/app/widgets/kf_animation_dialog.dart';
import 'package:fl_klikfilm/app/widgets/kf_app_bar.dart';
import 'package:fl_klikfilm/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';
import 'package:pinput/pinput.dart';

class VerificationMailPage extends HookConsumerWidget {
  final String email;
  final String registrationId;
  const VerificationMailPage({
    super.key,
    required this.email,
    required this.registrationId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forceError = useState(false);
    final otpController = useTextEditingController();

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
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Verification',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 54),
              Text(
                'Enter 6 digit code we sent to\nyour email',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              SizedBox(height: 34),
              Pinput(
                length: 6,
                controller: otpController,
                forceErrorState: forceError.value,
                errorText: 'Activation code is not match',
                errorTextStyle: TextStyle(
                  fontSize: 16,
                  color: KColors.red,
                ),
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                defaultPinTheme: PinTheme(
                  width: 48,
                  height: 48,
                  textStyle: TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  width: 50,
                  height: 50,
                  textStyle: TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: KColors.red),
                  ),
                ),
                showCursor: true,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
              ),
              SizedBox(height: 70),
              SizedBox(
                width: 320,
                child: ElevatedButton(
                  onPressed: () async {
                    if (otpController.length == 6) {
                      final authentication = ref.read(authenticationProvider);
                      await authentication.registerActivation(
                        otpController.text,
                        email: email,
                        registrationId: registrationId,
                        onValue: (response) async {
                          if (response.success) {
                            await ref.read(categoriesAsyncNotifier.notifier).forceRefresh().then((_) {
                              return HomeRoute().go(context);
                            });
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
                        },
                      );
                    }
                  },
                  child: Text('Continue'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
