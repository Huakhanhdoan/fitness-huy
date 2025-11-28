import 'package:base_project_flutter/app/presentation/widgets/common_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class CommonLoadingDialog {
  static show({
    bool isTransparent = false,
    String title = '',
    bool clickMaskDismiss = true,
  }) {
    SmartDialog.showLoading(
      maskColor: isTransparent ? Colors.transparent : Colors.black26,
      builder: (context) {
        return Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CommonLoading(),
                    if (title.isNotEmpty) ...[
                      const SizedBox(height: 10),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        );
      },
      clickMaskDismiss: clickMaskDismiss,
    );
  }

  static dismiss() {
    SmartDialog.dismiss();
  }
}
