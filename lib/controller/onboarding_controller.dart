import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/onboarding_list_data.dart';
import '../res/app_constant.dart';
import '../res/app_string.dart';
import '../res/routes/routes_name.dart';


class OnboardingController extends GetxController {
  /// Controls the onboarding page view
  final PageController pageController = PageController(initialPage: 0);

  /// Observable to track the current onboarding page index
  var currentIndex = 0.obs;

  /// Marks onboarding as completed and navigates to the SignIn page
  Future<void> skipOnboarding() async {
    AppConstant.isOnboardingViewed = true;
    await AppConstant.sharedPreferences!.setBool(
      AppString.onboardingViewedKey,
      AppConstant.isOnboardingViewed,
    );
    Get.offNamed(RoutesName.signInPage);
  }

  /// Moves to next onboarding page or skips if on the last page
  Future<void> goToNextPageOrSkip() async {
    if (currentIndex.value == OnBoardingListData.getOnboardingData.length - 1) {
      await skipOnboarding();
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}


/*
class OnboardingController extends GetxController {
  final PageController pageController = PageController(initialPage: 0);
  var currentIndex = 0.obs;

  /// Marks the onboarding as viewed in shared preferences and navigates to the sign-in page
  void skipOnboarding() {
    AppConstant.isViewed = 0;
    AppConstant.sharedPreferences!
        .setInt(AppString.prefOnboarding, AppConstant.isViewed!);
    Get.offNamed(RoutesName.signInPage);
  }

  /// Navigates to the next page in the onboarding sequence
  void goToNextPageOrSkip() {
    if (currentIndex.value ==
        OnBoardingListData.getOnboardingData().length - 1) {
      skipOnboarding();
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
*/