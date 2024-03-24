import 'package:fl_klikfilm/app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'app_router.g.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'mainBottomNavigatorKeyaergewgergwerfwefwfwd');

@TypedGoRoute<SplashRoute>(path: SplashRoute.path, name: SplashRoute.name)
class SplashRoute extends GoRouteData {
  const SplashRoute();
  static const name = 'Home';
  static const path = '/';

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: HomePage(),
      transitionsBuilder: (context, animation, animation2, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        );
      },
    );
  }
}
