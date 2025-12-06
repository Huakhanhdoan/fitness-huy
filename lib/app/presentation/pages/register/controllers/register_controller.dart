import 'package:base_project_flutter/app/core/base/base_controller.dart';
import 'package:base_project_flutter/app/core/utils/navigation_utils.dart';
import 'package:base_project_flutter/app/domain/use_cases/register_use_case.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class RegisterController extends BaseController {
  final RegisterUseCase registerUseCase = Get.find();

  Future<void> register(String email, String password, String name) async {
    showLoadingDialog();
    final result = await registerUseCase
        .execute(RegisterParams(email: email, password: password, name: name));
    hideLoadingDialog();
    if (result.isSuccess) {
      Get.snackbar('Success', 'Registration successful');
      NavigationUtils.toBottomNav();
      // Handle successful registration
    } else {
      Get.snackbar('Failed', "Registration failed");
      // Handle registration failure
    }
  }
}
