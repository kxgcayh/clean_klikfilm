import 'package:fl_klikfilm/app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'app_router.g.dart';

final primaryScaffoldKey = GlobalKey<ScaffoldState>();
final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'mainBottomNavigatorKeyaergewgergwerfwefwfwd');

@TypedGoRoute<HomeRoute>(path: HomeRoute.path, name: HomeRoute.name)
class HomeRoute extends GoRouteData {
  const HomeRoute();
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
