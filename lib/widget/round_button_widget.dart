import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users/res/apps_text_style.dart';

import '../res/app_colors.dart';

class RoundButtonWidget extends StatelessWidget {
  const RoundButtonWidget({
    super.key,
    required this.title,
    required this.onPress,
    this.buttonColors,
    this.width = 60,
    this.height = 50,
  });

  final String title;
  final double height, width;
  final VoidCallback onPress;
  final Color? buttonColors;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
          height: height.h,
          width: width.w,
          margin: EdgeInsets.symmetric(horizontal: 0.2.sw),
          decoration: BoxDecoration(
              color: buttonColors ?? AppColors.accentGreen,
              borderRadius: BorderRadius.circular(50.r)),
          child: Center(
            child: Text(
              title,
              style: AppsTextStyle.buttonTextStyle,
            ),
          )),
    );
  }
}
