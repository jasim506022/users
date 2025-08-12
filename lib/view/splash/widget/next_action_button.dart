import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/onboarding_controller.dart';
import '../../../data/onboarding_list_data.dart';
import '../../../res/app_colors.dart';
import '../../../res/app_function.dart';
import '../../../res/app_string.dart';
import '../../../res/apps_text_style.dart';

/// A button widget displaying a dynamic text label ("Next" or "Finish")
/// followed by a forward arrow icon. The label updates reactively based
/// on the onboarding progress managed by [OnboardingController].
///
/// Triggers the provided [onTap] callback when tapped.

class NextActionButtonWidget extends StatelessWidget {
  const NextActionButtonWidget({
    super.key,
    required this.onTap,

  });

  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {

    // Controller that manages onboarding state and navigation logic.
    final OnboardingController onboardingController =
    Get.find<OnboardingController>();

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [

            Obx(() {
              /// Reactively updates button text to "Finish" on last page, else "Next".
             var totalPage = OnBoardingListData.getOnboardingData.length - 1;
              final bool isLastPage = onboardingController.currentIndex.value == totalPage;
              return Text(
                isLastPage ? AppString.btnFinish : AppString.btnNext,
                style: AppsTextStyle.button,
              );
            }),

            AppsFunction.horizontalSpacing(10),
            Icon(Icons.arrow_forward_sharp, color: AppColors.white),
          ],
        ),
      ),
    );
  }
}



/*
/// A reusable button widget with an action and an arrow icon.
class NextActionButton extends StatelessWidget {
  const NextActionButton({
    super.key,
    required this.onTap,
    required this.title,
  });

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
        decoration: BoxDecoration(
            color: AppColors.black, borderRadius: BorderRadius.circular(15.r)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: AppsTextStyle.buttonTextStyle,
            ),
            AppsFunction.horizontalSpacing(10),
            Icon(
              Icons.arrow_forward_sharp,
              color: AppColors.white,
            )
          ],
        ),
      ),
    );
  }
}


 */
