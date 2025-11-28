import 'package:base_project_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';

class NavigationUtils {
  static void popUntilRoot() {
    Get.until((route) => route.isFirst);
  }

  static void closeAllDialog() {
    Get.until((route) => Get.isDialogOpen == false);
  }

  static void backNavigate() {
    Get.back();
  }

  static void toHome() {
    Get.offAllNamed(Routes.HOME);
  }

  static void toLogin() {
    Get.toNamed(Routes.LOGIN);
  }

  static void toRegister() {
    Get.toNamed(Routes.REGISTER);
  }

  static void toForgotPassword() {
    Get.toNamed(Routes.FORGOT_PASSWORD);
  }

  static void toBottomNav() {
    Get.offAllNamed(Routes.BOTTOM_NAV);
  }
}
