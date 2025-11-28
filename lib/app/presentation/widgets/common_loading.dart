import 'dart:io';

import 'package:base_project_flutter/app/core/constants/color_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonLoading extends StatelessWidget {
  const CommonLoading(
      {super.key,
      this.showLoading = true,
      this.width,
      this.height,
      this.color});

  final Color? color;
  final bool? showLoading;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return showLoading == true
        ? Center(
            child: Platform.isIOS
                ? SizedBox(
                    width: width ?? 28,
                    height: height ?? 28,
                    child: CupertinoActivityIndicator(
                      color: color ?? ColorConstants.primaryColor,
                    ),
                  )
                : SizedBox(
                    width: width ?? 28,
                    height: height ?? 28,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        color ?? ColorConstants.primaryColor,
                      ),
                    ),
                  ),
          )
        : const SizedBox();
  }
}
