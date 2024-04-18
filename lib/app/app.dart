import 'package:fl_klikfilm/app/routes/app_router.dart';
import 'package:fl_klikfilm/app/routes/router_listener.dart';
import 'package:fl_klikfilm/app/styles/kfilm_colors.dart';
import 'package:fl_klikfilm/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
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
        initialLocation: HomeRoute.path,
        debugLogDiagnostics: true,
        routes: $appRoutes,
        redirect: routerListenerNotifier.redirect,
      ),
      [routerListenerNotifier],
    );

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: MaterialApp.router(
        title: 'KlikFilm',
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        supportedLocales: const [
          ...FormBuilderLocalizations.supportedLocales,
        ],
        localizationsDelegates: const [
          FormBuilderLocalizations.delegate,
        ],
        theme: ThemeData(
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: KColors.primary,
          colorScheme: ColorScheme.dark(),
          fontFamily: FontFamily.roboto,
          brightness: Brightness.dark,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
              foregroundColor: Colors.white,
              backgroundColor: KColors.primary,
              textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, fontFamily: FontFamily.roboto),
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: TextStyle(
                color: Colors.grey,
                fontSize: 18,
                fontFamily: FontFamily.roboto,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
