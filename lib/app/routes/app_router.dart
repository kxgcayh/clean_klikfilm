import 'package:fl_klikfilm/app/pages/account_page.dart';
import 'package:fl_klikfilm/app/pages/authentication_page.dart';
import 'package:fl_klikfilm/app/pages/drawer_page.dart';
import 'package:fl_klikfilm/app/pages/home_page.dart';
import 'package:fl_klikfilm/app/pages/kids_mode_page.dart';
import 'package:fl_klikfilm/app/pages/link_to_tv_page.dart';
import 'package:fl_klikfilm/app/pages/point_page.dart';
import 'package:fl_klikfilm/app/pages/search_page.dart';
import 'package:fl_klikfilm/app/pages/startup/authentication/forgot_password_page.dart';
import 'package:fl_klikfilm/app/pages/startup/authentication/login_mail_page.dart';
import 'package:fl_klikfilm/app/pages/startup/authentication/login_phone_number_page.dart';
import 'package:fl_klikfilm/app/pages/startup/authentication/phone_otp_page.dart';
import 'package:fl_klikfilm/app/pages/startup/authentication/register_mail_page.dart';
import 'package:fl_klikfilm/app/pages/support_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';

part 'app_router.g.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'mainBottomNavigatorKeyaergewgergwerfwefwfwd');

@TypedGoRoute<HomeRoute>(
  path: HomeRoute.path,
  name: HomeRoute.name,
  routes: [
    TypedGoRoute<SearchRoute>(path: SearchRoute.path, name: SearchRoute.name),
    TypedGoRoute<MenuRoute>(path: MenuRoute.path, name: MenuRoute.name),
    TypedGoRoute<AccountRoute>(path: AccountRoute.path, name: AccountRoute.name),
    TypedGoRoute<PointRoute>(path: PointRoute.path, name: PointRoute.name),
    TypedGoRoute<LinkToTvRoute>(path: LinkToTvRoute.path, name: LinkToTvRoute.name),
    TypedGoRoute<KidsModeRoute>(path: KidsModeRoute.path, name: KidsModeRoute.name),
    TypedGoRoute<SupportRoute>(path: SupportRoute.path, name: SupportRoute.name),
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
      transitionDuration: Duration(milliseconds: 350),
      transitionsBuilder: (context, animation, animation2, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeIn).animate(animation),
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
      transitionDuration: Duration(milliseconds: 350),
      transitionsBuilder: (context, animation, animation2, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeIn).animate(animation),
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
      child: const DrawerPage(),
      transitionDuration: Duration(milliseconds: 350),
      transitionsBuilder: (context, animation, animation2, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeIn).animate(animation),
          child: child,
        );
      },
    );
  }
}

class AccountRoute extends GoRouteData {
  const AccountRoute();
  static const name = 'Account';
  static const path = 'account';

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: const AccountPage(),
      transitionDuration: Duration(milliseconds: 350),
      transitionsBuilder: (context, animation, animation2, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeIn).animate(animation),
          child: child,
        );
      },
    );
  }
}

class PointRoute extends GoRouteData {
  const PointRoute();
  static const name = 'Point';
  static const path = 'point';

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: const PointPage(),
      transitionDuration: Duration(milliseconds: 350),
      transitionsBuilder: (context, animation, animation2, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeIn).animate(animation),
          child: child,
        );
      },
    );
  }
}

class LinkToTvRoute extends GoRouteData {
  const LinkToTvRoute();
  static const name = 'Link to TV';
  static const path = 'link-to-tv';

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: const LinkToTvPage(),
      transitionDuration: Duration(milliseconds: 350),
      transitionsBuilder: (context, animation, animation2, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeIn).animate(animation),
          child: child,
        );
      },
    );
  }
}

class KidsModeRoute extends GoRouteData {
  const KidsModeRoute();
  static const name = 'Kids Mode';
  static const path = 'kids-mode';

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: const KidsModePage(),
      transitionDuration: Duration(milliseconds: 350),
      transitionsBuilder: (context, animation, animation2, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeIn).animate(animation),
          child: child,
        );
      },
    );
  }
}

@TypedGoRoute<AuthenticationRoute>(
  path: AuthenticationRoute.path,
  name: AuthenticationRoute.name,
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<LoginMailRoute>(path: LoginMailRoute.path, name: LoginMailRoute.name),
    TypedGoRoute<RegisterMailRoute>(path: RegisterMailRoute.path, name: RegisterMailRoute.name),
    TypedGoRoute<ForgotPasswordRoute>(path: ForgotPasswordRoute.path, name: ForgotPasswordRoute.name),
    TypedGoRoute<LoginPhoneNumberRoute>(
      path: LoginPhoneNumberRoute.path,
      name: LoginPhoneNumberRoute.name,
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<PhoneOtpRoute>(path: PhoneOtpRoute.path, name: PhoneOtpRoute.name),
      ],
    ),
  ],
)
class AuthenticationRoute extends GoRouteData {
  const AuthenticationRoute();
  static const name = 'Authentication';
  static const path = '/authentication';

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: const AuthenticationPage(),
      transitionDuration: Duration(milliseconds: 350),
      transitionsBuilder: (context, animation, animation2, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeIn).animate(animation),
          child: child,
        );
      },
    );
  }
}

class LoginMailRoute extends GoRouteData {
  const LoginMailRoute();
  static const name = 'Login Email';
  static const path = 'email';

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: const LoginMailPage(),
      transitionDuration: Duration(milliseconds: 350),
      transitionsBuilder: (context, animation, animation2, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeIn).animate(animation),
          child: child,
        );
      },
    );
  }
}

class RegisterMailRoute extends GoRouteData {
  const RegisterMailRoute();
  static const name = 'Register Email';
  static const path = 'register';

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: const RegisterMailPage(),
      transitionDuration: Duration(milliseconds: 350),
      transitionsBuilder: (context, animation, animation2, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeIn).animate(animation),
          child: child,
        );
      },
    );
  }
}

class ForgotPasswordRoute extends GoRouteData {
  const ForgotPasswordRoute();
  static const name = 'Forgot Password';
  static const path = 'forgot-password';

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: const ForgotPasswordPage(),
      transitionDuration: Duration(milliseconds: 350),
      transitionsBuilder: (context, animation, animation2, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeIn).animate(animation),
          child: child,
        );
      },
    );
  }
}

class LoginPhoneNumberRoute extends GoRouteData {
  const LoginPhoneNumberRoute();
  static const name = 'Phone Number';
  static const path = 'phone';

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: const LoginPhoneNumberPage(),
      transitionDuration: Duration(milliseconds: 350),
      transitionsBuilder: (context, animation, animation2, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeIn).animate(animation),
          child: child,
        );
      },
    );
  }
}

class PhoneOtpRoute extends GoRouteData {
  final String sessionId;
  final String phoneNumber;
  const PhoneOtpRoute({
    required this.sessionId,
    required this.phoneNumber,
  });
  static const name = 'Phone Number OTP';
  static const path = 'phone-otp';

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: PhoneOtpPage(
        sessionId: sessionId,
        phoneNumber: phoneNumber,
      ),
      transitionDuration: Duration(milliseconds: 350),
      transitionsBuilder: (context, animation, animation2, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeIn).animate(animation),
          child: child,
        );
      },
    );
  }
}

class SupportRoute extends GoRouteData {
  final GeneralInformationType type;
  const SupportRoute({required this.type});

  static const name = 'Support';
  static const path = 'support';

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: SupportPage(type: type),
      transitionDuration: Duration(milliseconds: 350),
      transitionsBuilder: (context, animation, animation2, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeIn).animate(animation),
          child: child,
        );
      },
    );
  }
}
