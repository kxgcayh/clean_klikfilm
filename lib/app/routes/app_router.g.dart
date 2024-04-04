// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeRoute,
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
        type:
            _$SupportTypeEnumMap._$fromName(state.uri.queryParameters['type']!),
      );

  String get location => GoRouteData.$location(
        '/support',
        queryParams: {
          'type': _$SupportTypeEnumMap[type],
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

const _$SupportTypeEnumMap = {
  SupportType.contactUs: 'contact-us',
  SupportType.termsOfUse: 'terms-of-use',
  SupportType.faq: 'faq',
  SupportType.privacyPolicy: 'privacy-policy',
};

extension<T extends Enum> on Map<T, String> {
  T _$fromName(String value) =>
      entries.singleWhere((element) => element.value == value).key;
}
