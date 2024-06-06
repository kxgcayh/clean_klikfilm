import 'package:fl_klikfilm/app/routes/app_router.dart';
import 'package:fl_klikfilm/app/routes/router_listener.dart';
import 'package:fl_klikfilm/app/styles/kfilm_colors.dart';
import 'package:fl_klikfilm/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

class KlikFilmApp extends HookConsumerWidget {
  const KlikFilmApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routerListenerNotifier = ref.watch(routerListenerProvider.notifier);
    final rootKey = useMemoized(() => rootNavigatorKey);
    final GoRouter router = useMemoized(
      () => GoRouter(
        navigatorKey: rootKey,
        refreshListenable: routerListenerNotifier,
        initialLocation: HomeRoute.path,
        debugLogDiagnostics: true,
        routes: $appRoutes,
        redirect: routerListenerNotifier.redirect,
        errorPageBuilder: (context, state) =>
            PageNotFoundRoute(error: state.error!).buildPage(context, state),
      ),
      [routerListenerNotifier],
    );

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: MaterialApp.router(
        title: 'KlikFilm',
        routerConfig: router,
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
        ),
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
