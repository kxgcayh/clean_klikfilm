import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:fl_klikfilm/app/app.dart';
import 'package:fl_klikfilm/app/pages/startup/startup_widget.dart';
import 'package:fl_klikfilm/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ProviderScope(
      child: AppStartupWidget(
        onLoaded: (context) => const KlikFilmApp(),
      ),
    ),
  );
}
