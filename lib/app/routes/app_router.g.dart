// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeRoute,
      $authenticationRoute,
    ];

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/',
      name: 'Home',
      factory: $HomeRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'search',
          name: 'Search',
          factory: $SearchRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'menu',
          name: 'Menu',
          factory: $MenuRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'account',
          name: 'Account',
          factory: $AccountRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'delete-account',
              name: 'Delete Account',
              factory: $DeleteAccountRouteExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: 'point',
          name: 'Point',
          factory: $PointRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'link-to-tv',
          name: 'Link to TV',
          factory: $LinkToTvRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'kids-mode',
          name: 'Kids Mode',
          factory: $KidsModeRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'support',
          name: 'Support',
          factory: $SupportRouteExtension._fromState,
        ),
      ],
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SearchRouteExtension on SearchRoute {
  static SearchRoute _fromState(GoRouterState state) => const SearchRoute();

  String get location => GoRouteData.$location(
        '/search',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $MenuRouteExtension on MenuRoute {
  static MenuRoute _fromState(GoRouterState state) => const MenuRoute();

  String get location => GoRouteData.$location(
        '/menu',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AccountRouteExtension on AccountRoute {
  static AccountRoute _fromState(GoRouterState state) => const AccountRoute();

  String get location => GoRouteData.$location(
        '/account',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $DeleteAccountRouteExtension on DeleteAccountRoute {
  static DeleteAccountRoute _fromState(GoRouterState state) =>
      const DeleteAccountRoute();

  String get location => GoRouteData.$location(
        '/account/delete-account',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PointRouteExtension on PointRoute {
  static PointRoute _fromState(GoRouterState state) => const PointRoute();

  String get location => GoRouteData.$location(
        '/point',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $LinkToTvRouteExtension on LinkToTvRoute {
  static LinkToTvRoute _fromState(GoRouterState state) => const LinkToTvRoute();

  String get location => GoRouteData.$location(
        '/link-to-tv',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $KidsModeRouteExtension on KidsModeRoute {
  static KidsModeRoute _fromState(GoRouterState state) => const KidsModeRoute();

  String get location => GoRouteData.$location(
        '/kids-mode',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SupportRouteExtension on SupportRoute {
  static SupportRoute _fromState(GoRouterState state) => SupportRoute(
        type: _$GeneralInformationTypeEnumMap
            ._$fromName(state.uri.queryParameters['type']!),
      );

  String get location => GoRouteData.$location(
        '/support',
        queryParams: {
          'type': _$GeneralInformationTypeEnumMap[type],
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

const _$GeneralInformationTypeEnumMap = {
  GeneralInformationType.contact: 'contact',
  GeneralInformationType.tou: 'tou',
  GeneralInformationType.faq: 'faq',
  GeneralInformationType.privacyPolicy: 'privacy-policy',
};

extension<T extends Enum> on Map<T, String> {
  T _$fromName(String value) =>
      entries.singleWhere((element) => element.value == value).key;
}

RouteBase get $authenticationRoute => GoRouteData.$route(
      path: '/authentication',
      name: 'Authentication',
      factory: $AuthenticationRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'email',
          name: 'Login Email',
          factory: $LoginMailRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'register',
          name: 'Register Email',
          factory: $RegisterMailRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'forgot-password',
          name: 'Forgot Password',
          factory: $ForgotPasswordRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'phone',
          name: 'Phone Number',
          factory: $LoginPhoneNumberRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'phone-otp',
              name: 'Phone Number OTP',
              factory: $PhoneOtpRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $AuthenticationRouteExtension on AuthenticationRoute {
  static AuthenticationRoute _fromState(GoRouterState state) =>
      const AuthenticationRoute();

  String get location => GoRouteData.$location(
        '/authentication',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $LoginMailRouteExtension on LoginMailRoute {
  static LoginMailRoute _fromState(GoRouterState state) =>
      const LoginMailRoute();

  String get location => GoRouteData.$location(
        '/authentication/email',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $RegisterMailRouteExtension on RegisterMailRoute {
  static RegisterMailRoute _fromState(GoRouterState state) =>
      const RegisterMailRoute();

  String get location => GoRouteData.$location(
        '/authentication/register',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ForgotPasswordRouteExtension on ForgotPasswordRoute {
  static ForgotPasswordRoute _fromState(GoRouterState state) =>
      const ForgotPasswordRoute();

  String get location => GoRouteData.$location(
        '/authentication/forgot-password',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $LoginPhoneNumberRouteExtension on LoginPhoneNumberRoute {
  static LoginPhoneNumberRoute _fromState(GoRouterState state) =>
      const LoginPhoneNumberRoute();

  String get location => GoRouteData.$location(
        '/authentication/phone',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PhoneOtpRouteExtension on PhoneOtpRoute {
  static PhoneOtpRoute _fromState(GoRouterState state) => PhoneOtpRoute(
        sessionId: state.uri.queryParameters['session-id']!,
        phoneNumber: state.uri.queryParameters['phone-number']!,
      );

  String get location => GoRouteData.$location(
        '/authentication/phone/phone-otp',
        queryParams: {
          'session-id': sessionId,
          'phone-number': phoneNumber,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
