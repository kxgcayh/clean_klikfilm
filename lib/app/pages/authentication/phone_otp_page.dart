import 'package:fl_klikfilm/app/providers/categories/categories_provider.dart';
import 'package:fl_klikfilm/app/routes/app_router.dart';
import 'package:fl_klikfilm/app/styles/kfilm_colors.dart';
import 'package:fl_klikfilm/app/widgets/kf_app_bar.dart';
import 'package:fl_klikfilm/app/widgets/kf_animation_dialog.dart';
import 'package:fl_klikfilm/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';
import 'package:pinput/pinput.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class PhoneOtpPage extends HookConsumerWidget {
  final String sessionId;
  final String phoneNumber;
  const PhoneOtpPage({
    super.key,
    required this.sessionId,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otpController = useTextEditingController();
    final countDownController = useMemoized(() => CountdownController(autoStart: true));

    useEffect(() {
      countDownController.restart();
      return () => countDownController.pause();
    }, [countDownController]);

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
              SizedBox(height: 85),
              Text(
                'Enter 6 digit code we sent to\n$phoneNumber',
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
                senderPhoneNumber: phoneNumber,
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
              SizedBox(height: 45),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Resend code in',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  SizedBox(width: 5),
                  Countdown(
                    controller: countDownController,
                    seconds: 60,
                    build: (_, double time) => Text(
                      TimerHelper.durationToMinSec(time),
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                    interval: Duration(milliseconds: 100),
                    onFinished: () async {
                      // await ref.read(pushOtpProvider(phoneNumber)).then((_) => countDownController.restart());
                    },
                  ),
                ],
              ),
              SizedBox(height: 40),
              SizedBox(
                width: 320,
                child: ElevatedButton(
                  onPressed: () async {
                    if (otpController.length == 6) {
                      final OtpValidationFamily arg = OtpValidationFamily(
                        sessionId: sessionId,
                        otp: otpController.text,
                      );
                      await ref.read(otpValidationProvider(arg)).then(
                        (response) async {
                          if (response.status?.code != '0') {
                            await showDialog(
                              context: context,
                              barrierDismissible: true,
                              useRootNavigator: false,
                              builder: (BuildContext context) {
                                return KfAnimationDialog(
                                  title: 'Oops',
                                  message: 'Hubungi *500*60# untuk berlangganan',
                                  lottieAsset: Assets.animations.failBouncy,
                                );
                              },
                            );
                          } else {
                            await ref.read(checkMembershipByMsisdnProvider(phoneNumber)).then((response) {
                              if (response.data != null) {
                                ref.invalidate(categoriesAsyncNotifier);
                                ref.read(localUserNotifierProvider.notifier)
                                  ..updateUserId(userId: response.data?.id ?? phoneNumber)
                                  ..updateAccessToken(response.data?.id ?? phoneNumber)
                                  ..setLogin(AuthenticationType.phone).then((_) => HomeRoute().go(context));
                              }
                            });
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
