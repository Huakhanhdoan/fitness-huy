import 'package:base_project_flutter/app/domain/use_cases/forgot_password_use_case.dart';
import 'package:get/get.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordUseCase>(() => ForgotPasswordUseCase(Get.find()));
    Get.lazyPut<ForgotPasswordController>(
      () => ForgotPasswordController(Get.find()),
    );
  }
}
