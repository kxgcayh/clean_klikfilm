import 'package:fl_klikfilm/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class StartupLoadingWidget extends StatelessWidget {
  const StartupLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Assets.pictures.logo.image(filterQuality: FilterQuality.high),
        ),
      ),
    );
  }
}
