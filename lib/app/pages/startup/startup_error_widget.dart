import 'package:fl_klikfilm/app/extensions/widget_extension.dart';
import 'package:fl_klikfilm/app/styles/kfilm_colors.dart';
import 'package:fl_klikfilm/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';

class AppStartupErrorPage extends StatelessWidget {
  final Object? error;
  final void Function()? onRetry;
  const AppStartupErrorPage({super.key, this.error, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Center(
              child: Assets.pictures.logo.image(filterQuality: FilterQuality.high),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (error is ConnectionErrorException)
                          Text(
                            'Please Check Your Internet Connection',
                            style: TextStyle(color: Colors.white),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 1.2,
                            child: TextButton(
                              onPressed: onRetry,
                              style: TextButton.styleFrom(
                                backgroundColor: KColors.crimson,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.5),
                                ),
                              ),
                              child: 'Try Again'.text(color: Colors.white).weight(FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
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
