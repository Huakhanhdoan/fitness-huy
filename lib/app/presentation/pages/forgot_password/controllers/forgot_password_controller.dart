import 'package:base_project_flutter/app/core/base/base_controller.dart';
import 'package:base_project_flutter/app/domain/use_cases/forgot_password_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends BaseController {
  final ForgotPasswordUseCase forgotPasswordUseCase;

  ForgotPasswordController(this.forgotPasswordUseCase);

  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> resetPassword() async {
    if (formKey.currentState?.validate() ?? false) {
      showLoadingDialog();
      final result = await forgotPasswordUseCase
          .execute(ForgotPasswordParams(email: emailController.text));
      if (result.isSuccess) {
        hideLoadingDialog();
        Get.snackbar('Success', 'Password reset email sent');
        // Navigate back or to login
      } else {
        hideLoadingDialog();
        Get.snackbar('Error', 'Failed to send reset email');
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
