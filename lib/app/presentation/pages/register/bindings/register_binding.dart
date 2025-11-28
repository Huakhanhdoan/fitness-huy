import 'package:base_project_flutter/app/domain/use_cases/register_use_case.dart';
import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterUseCase>(() => RegisterUseCase(Get.find()));
    Get.lazyPut<RegisterController>(
      () => RegisterController(),
    );
  }
}
