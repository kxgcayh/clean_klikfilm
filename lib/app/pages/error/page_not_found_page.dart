import 'package:fl_klikfilm/app/routes/app_router.dart';
import 'package:fl_klikfilm/app/styles/kfilm_colors.dart';
import 'package:fl_klikfilm/gen/assets.gen.dart';
import 'package:fl_klikfilm/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PageNotFoundPage extends StatelessWidget {
  final Exception error;
  const PageNotFoundPage({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Assets.pictures.logo.image(width: 134, height: 26),
        flexibleSpace: Assets.pictures.batikApb.image(fit: BoxFit.fitWidth),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Maaf',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    fontFamily: FontFamily.poppins,
                  ),
                ),
                LottieBuilder.asset(Assets.animations.sadNotFound),
                Text(
                  'Halaman tidak ditemukan',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    fontFamily: FontFamily.poppins,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 1.2,
              child: TextButton(
                onPressed: () => HomeRoute().go(context),
                style: TextButton.styleFrom(
                  backgroundColor: KColors.darkRed,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.5),
                  ),
                ),
                child: Text(
                  'Kembali ke Home',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: FontFamily.poppins,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
