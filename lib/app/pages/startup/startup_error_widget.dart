import 'package:fl_klikfilm/app/extensions/widget_extension.dart';
import 'package:fl_klikfilm/app/styles/kfilm_colors.dart';
import 'package:fl_klikfilm/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class AppStartupErrorPage extends StatelessWidget {
  final String? message;
  final void Function()? onRetry;
  const AppStartupErrorPage({super.key, this.message, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Assets.pictures.logo.image(filterQuality: FilterQuality.high),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 18),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: TextButton(
                        onPressed: onRetry,
                        style: TextButton.styleFrom(
                          backgroundColor: KFilmColors.crimson,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.5),
                          ),
                        ),
                        child: 'Try Again'.text(color: Colors.white).weight(FontWeight.w500),
                      ),
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
