import 'package:fl_klikfilm/app/routes/app_router.dart';
import 'package:fl_klikfilm/app/styles/kfilm_colors.dart';
import 'package:fl_klikfilm/app/widgets/kf_app_bar.dart';
import 'package:fl_klikfilm/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';
import 'package:pinput/pinput.dart';

class KidsModePage extends HookConsumerWidget {
  const KidsModePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localNotifier = ref.read(commonUserDataProvider.notifier);
    final pinController = useTextEditingController();

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.centerLeft,
          image: AssetImage(Assets.pictures.batikDrawer.path),
          fit: BoxFit.fitHeight,
          repeat: ImageRepeat.repeatY,
        ),
      ),
      child: Scaffold(
        appBar: KfAppBar(),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Assets.pictures.supportHeader.image(
              height: 250,
              filterQuality: FilterQuality.high,
              isAntiAlias: true,
              fit: BoxFit.fill,
            ),
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.35),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    SizedBox(height: 220),
                    Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              spreadRadius: -1,
                              blurRadius: 10,
                              offset: Offset(3, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Kids Mode',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Silahkan membuat\nkode akses yang terdiri\ndari 4 digit angka',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 12),
                            Pinput(
                              length: 4,
                              controller: pinController,
                              hapticFeedbackType: HapticFeedbackType.lightImpact,
                              defaultPinTheme: PinTheme(
                                width: 48,
                                height: 48,
                                textStyle: TextStyle(
                                  fontSize: 28,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
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
                                  fontWeight: FontWeight.w500,
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
                            SizedBox(height: 12),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 4,
                              child: TextButton(
                                onPressed: () async {
                                  if (pinController.length == 4) {
                                    await localNotifier.setKidsMode(pinController.text);
                                    await Future.delayed(Duration()).then((_) => HomeRoute().go(context));
                                  }
                                },
                                child: Text('OK'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
