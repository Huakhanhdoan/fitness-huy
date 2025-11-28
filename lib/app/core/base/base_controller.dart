import 'package:base_project_flutter/app/presentation/widgets/common_loading_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

export 'package:get/get_rx/get_rx.dart';
export 'package:get/instance_manager.dart';

class BaseController<T> extends SuperController {
  T get input => Get.arguments;

  final _isLoading = false.obs;
  get isLoading => _isLoading.value;

  final _isLoadingDialogShowing = false.obs;
  get isLoadingDialogShowing => _isLoadingDialogShowing.value;

  showLoading() {
    _isLoading.value = true;
  }

  hideLoading() {
    _isLoading.value = false;
  }

  showLoadingDialog({
    bool isTransparent = false,
    String? title,
    bool clickMaskDismiss = true,
  }) {
    CommonLoadingDialog.show(
      isTransparent: isTransparent,
      title: title ?? '',
      clickMaskDismiss: clickMaskDismiss,
    );
    _isLoadingDialogShowing.value = true;
  }

  hideLoadingDialog() {
    CommonLoadingDialog.dismiss();
    _isLoadingDialogShowing.value = false;
  }

  showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
    );
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onDetached() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}

  void back() {
    Get.back();
  }

  void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }
}
