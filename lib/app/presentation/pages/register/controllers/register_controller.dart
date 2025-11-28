import 'package:base_project_flutter/app/core/base/base_controller.dart';
import 'package:base_project_flutter/app/core/utils/navigation_utils.dart';
import 'package:base_project_flutter/app/domain/use_cases/register_use_case.dart';

class RegisterController extends BaseController {
  final RegisterUseCase registerUseCase = Get.find();

  Future<void> register(String email, String password) async {
    final result = await registerUseCase
        .execute(RegisterParams(email: email, password: password));
    if (result.isSuccess) {
      NavigationUtils.backNavigate();
      // Handle successful registration
    } else {
      // Handle registration failure
    }
  }
}
