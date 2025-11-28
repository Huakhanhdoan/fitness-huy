import 'package:base_project_flutter/app/core/constants/app_constants.dart';
import 'package:base_project_flutter/app/core/constants/color_constants.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton(
      {super.key, this.onPressed, required this.title, this.textStyle});

  final VoidCallback? onPressed;
  final String title;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorConstants.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.s12),
        ),
      ),
      child: Text(
        title,
        style: textStyle ??
            const TextStyle(
              color: Colors.white,
            ),
      ),
    );
  }
}
