import 'package:get/get.dart';

import '../presentation/pages/bottom_nav/bindings/bottom_nav_binding.dart';
import '../presentation/pages/bottom_nav/views/bottom_nav_view.dart';
import '../presentation/pages/forgot_password/bindings/forgot_password_binding.dart';
import '../presentation/pages/forgot_password/views/forgot_password_view.dart';
import '../presentation/pages/home/bindings/home_binding.dart';
import '../presentation/pages/home/views/home_view.dart';
import '../presentation/pages/login/bindings/login_binding.dart';
import '../presentation/pages/login/views/login_view.dart';
import '../presentation/pages/register/bindings/register_binding.dart';
import '../presentation/pages/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAV,
      page: () => const BottomNavView(),
      binding: BottomNavBinding(),
    ),
  ];
}
