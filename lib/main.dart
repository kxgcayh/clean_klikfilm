import 'dart:async';

import 'package:fl_klikfilm/app/app.dart';
import 'package:fl_klikfilm/app/pages/startup/startup_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ProviderScope(child: AppStartupWidget(onLoaded: (context) => KlikFilmApp())),
  );
}
