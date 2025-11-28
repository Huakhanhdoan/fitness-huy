import 'package:base_project_flutter/app/domain/use_cases/login.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginUseCase>(
      () => LoginUseCase(Get.find()),
    );

    Get.lazyPut<LoginController>(
      () => LoginController(Get.find()),
    );
  }
}
