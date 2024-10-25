import 'package:get/get.dart';

import '../modules/authentication/bindings/authentication_binding.dart';
import '../modules/authentication/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/authentication/forgot_password/password_verification/bindings/password_verification_binding.dart';
import '../modules/authentication/forgot_password/password_verification/views/password_verification_view.dart';
import '../modules/authentication/forgot_password/views/forgot_password_view.dart';
import '../modules/authentication/login_by_mail/bindings/login_by_mail_binding.dart';
import '../modules/authentication/login_by_mail/views/login_by_mail_view.dart';
import '../modules/authentication/login_by_phone/bindings/login_by_phone_binding.dart';
import '../modules/authentication/login_by_phone/views/login_by_phone_view.dart';
import '../modules/authentication/register/bindings/register_binding.dart';
import '../modules/authentication/register/views/register_view.dart';
import '../modules/authentication/views/authentication_view.dart';
import '../modules/drawer_menu/bindings/drawer_menu_binding.dart';
import '../modules/drawer_menu/views/drawer_menu_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DRAWER_MENU,
      page: () => DrawerMenuView(),
      binding: DrawerMenuBinding(),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => const SearchView(),
      binding: SearchBinding(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: _Paths.AUTHENTICATION,
      page: () => const AuthenticationView(),
      binding: AuthenticationBinding(),
      transition: Transition.fadeIn,
      children: [
        GetPage(
          name: _Paths.LOGIN_BY_MAIL,
          page: () => const LoginByMailView(),
          binding: LoginByMailBinding(),
        ),
        GetPage(
          name: _Paths.REGISTER,
          page: () => const RegisterView(),
          binding: RegisterBinding(),
        ),
        GetPage(
          name: _Paths.LOGIN_BY_PHONE,
          page: () => const LoginByPhoneView(),
          binding: LoginByPhoneBinding(),
        ),
        GetPage(
          name: _Paths.FORGOT_PASSWORD,
          page: () => const ForgotPasswordView(),
          binding: ForgotPasswordBinding(),
          children: [
            GetPage(
              name: _Paths.PASSWORD_VERIFICATION,
              page: () => const PasswordVerificationView(),
              binding: PasswordVerificationBinding(),
            ),
          ],
        ),
      ],
    ),
  ];
}
