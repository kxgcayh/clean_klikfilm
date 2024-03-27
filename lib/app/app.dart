import 'package:fl_klikfilm/app/routes/app_router.dart';
import 'package:fl_klikfilm/app/routes/router_listener.dart';
import 'package:fl_klikfilm/app/styles/kfilm_colors.dart';
import 'package:fl_klikfilm/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class KlikFilmApp extends HookConsumerWidget {
  const KlikFilmApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routerListenerNotifier = ref.watch(routerListenerProvider.notifier);
    final navigatorKey = useRef(rootNavigatorKey);
    final GoRouter router = useMemoized(
      () => GoRouter(
        navigatorKey: navigatorKey.value,
        refreshListenable: routerListenerNotifier,
        initialLocation: SplashRoute.path,
        debugLogDiagnostics: true,
        routes: $appRoutes,
        redirect: routerListenerNotifier.redirect,
      ),
      [routerListenerNotifier],
    );

    return MaterialApp.router(
      title: 'KlikFilm',
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSeed(seedColor: KFilmColors.primary),
        fontFamily: FontFamily.roboto,
      ),
    );
  }
}
