import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../res/apps_text_style.dart';



class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
    required this.image,
    required this.title,
  });

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          image,
          height: 600.h,
          width: 300.w,
        ),
        Positioned(
          top: 120.h,
          left: 130.w,
          right: 40.w,
          child: Center(
            child: Container(
              height: 300.h,
              width: 130.w,
              alignment: Alignment.center,
              child: Text(title, style: AppsTextStyle.emptyTestStyle),
            ),
          ),
        )
      ],
    );
  }
}
