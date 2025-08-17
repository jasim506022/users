import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../res/app_colors.dart';
import '../res/app_function.dart';
import '../res/app_string.dart';
import 'custom_outline_button.dart';

/// A reusable and customizable alert dialog with title, content, and action buttons.
///
/// Features:
/// - Optional custom colors for icon and buttons
/// - Flexible title/content display
/// - Built-in confirm/cancel actions with sensible defaults
class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onConfirmPressed,
    this.onCancelPressed,
    required this.icon,
    this.iconColor,
    this.confirmButtonColor,
    this.cancelButtonColor,
  });

  final String title;
  final String content;
  final VoidCallback onConfirmPressed;
  final VoidCallback? onCancelPressed;
  final IconData icon;
  final Color? iconColor;
  final Color? confirmButtonColor;
  final Color? cancelButtonColor;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: _buildDialogHeader(),
      content: Text(content),
      actions: _buildActionButtons(),
    );
  }

  /// Builds the alert dialog header with an icon and title.
  Row _buildDialogHeader() {
    return Row(
      children: [
        Text(title),
        AppsFunction.horizontalSpacing(10),
        CircleAvatar(
          radius: 16,
          backgroundColor: iconColor ?? AppColors.red,
          child: Icon(icon, color: AppColors.white, size: 18),
        ),
      ],
    );
  }

  /// Builds the action buttons for the dialog.
  List<Widget> _buildActionButtons() {
    return [
      CustomOutlinedButton(
        color: confirmButtonColor ?? AppColors.accentGreen,
        title: AppString.btnYes,
        onPressed: onConfirmPressed,
      ),
      CustomOutlinedButton(
        color: cancelButtonColor ?? AppColors.red,
        title: AppString.btnNo,
        onPressed: onCancelPressed ?? () => Get.back(),
      ),
    ];
  }
}
