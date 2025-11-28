import 'package:base_project_flutter/app/core/base/base_controller.dart';
import 'package:base_project_flutter/app/presentation/widgets/common_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

export 'package:flutter/material.dart';
export 'package:get/get_navigation/get_navigation.dart';
export 'package:get/get_state_manager/get_state_manager.dart';
export 'package:get/get_utils/src/extensions/context_extensions.dart';

abstract class BaseGetView<W extends BaseController> extends GetView<W> {
  const BaseGetView({super.key});

  @protected
  Widget myBuild(BuildContext context);

  bool get isShowLoading => true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        myBuild(context),
        Obx(
          () => controller.isLoading
              ? Loading(
                  isShowLoading: isShowLoading,
                )
              : const SizedBox(),
        )
      ],
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({super.key, required this.isShowLoading});

  final bool isShowLoading;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Stack(
        children: <Widget>[
          const ModalBarrier(
            dismissible: true,
            color: Colors.transparent,
          ),
          Center(
            child: isShowLoading ? const CommonLoading() : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
