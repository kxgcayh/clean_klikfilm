import 'package:fl_klikfilm/app/pages/drawer_page.dart';
import 'package:fl_klikfilm/app/pages/home_page.dart';
import 'package:fl_klikfilm/app/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'app_router.g.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'mainBottomNavigatorKeyaergewgergwerfwefwfwd');

@TypedGoRoute<HomeRoute>(
  path: HomeRoute.path,
  name: HomeRoute.name,
  routes: [
    TypedGoRoute<SearchRoute>(path: SearchRoute.path, name: SearchRoute.name),
    TypedGoRoute<MenuRoute>(path: MenuRoute.path, name: MenuRoute.name),
  ],
)
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

class SearchRoute extends GoRouteData {
  const SearchRoute();
  static const name = 'Search';
  static const path = 'search';

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: SearchPage(),
      transitionsBuilder: (context, animation, animation2, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        );
      },
    );
  }
}

class MenuRoute extends GoRouteData {
  const MenuRoute();
  static const name = 'Menu';
  static const path = 'menu';

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: DrawerPage(),
      transitionsBuilder: (context, animation, animation2, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        );
      },
    );
  }
}
