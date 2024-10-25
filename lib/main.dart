import 'dart:async';

import 'package:fl_klikfilm/app/bindings/initial_bindings.dart';
import 'package:fl_klikfilm/app/data/app_colors.dart';
import 'package:fl_klikfilm/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_secure_storage/get_secure_storage.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GetStorage.init();
  await GetSecureStorage.init(password: 'strongpassword');
  runApp(
    GetMaterialApp(
      title: 'KlikFilm',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: InitialBindings(),
      theme: ThemeData(
        fontFamily: FontFamily.nunito,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
      ),
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: double.infinity, name: TABLET),
        ],
      ),
    ),
  );
}
