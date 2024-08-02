import 'package:fl_klikfilm/app/routes/app_router.dart';
import 'package:fl_klikfilm/app/routes/router_listener.dart';
import 'package:fl_klikfilm/app/styles/kfilm_themes.dart';
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
    final GoRouter router = useMemoized(
      () => GoRouter(
        navigatorKey: rootNavigatorKey,
        refreshListenable: routerListenerNotifier,
        initialLocation: HomeRoute.path,
        debugLogDiagnostics: true,
        routes: $appRoutes,
        redirect: routerListenerNotifier.redirect,
        errorPageBuilder: (context, state) {
          return PageNotFoundRoute(error: state.error!).buildPage(context, state);
        },
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
        theme: KFilmThemes.defaultTheme(context, bodyFont: 'Roboto', displayFont: 'Roboto'),
      ),
    );
  }
}
