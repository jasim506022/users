import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../res/app_asset/icon_asset.dart';
import '../res/app_function.dart';
import '../res/app_string.dart';
import '../res/apps_text_style.dart';

/// A widget that displays the application's logo and name.
///
/// Consists of:
/// - The app icon loaded from assets.
/// - The app name text styled with the logo text style
class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // App icon image
        Image.asset(
          AppIcons.appIcon,
          height: 80.h,
          width: 100.w,
          fit: BoxFit.fill,
        ),
        AppsFunction.verticalSpacing(10),
        // App name text
        Text(AppString.appName, style: AppsTextStyle.logoTextStyle),
      ],
    );
  }
}
