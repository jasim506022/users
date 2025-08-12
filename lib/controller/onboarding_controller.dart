import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/onboarding_list_data.dart';
import '../res/app_constant.dart';
import '../res/app_string.dart';
import '../res/routes/routes_name.dart';

/// Controller for managing onboarding flow.
///
/// Handles page navigation, current page tracking,
/// and saving the onboarding completion state.
class OnboardingController extends GetxController {
  /// Controls the onboarding page view
  final PageController pageController = PageController(initialPage: 0);

  /// Observable to track the current onboarding page index
  var currentIndex = 0.obs;

  /// Skips onboarding, saves state to shared preferences,
  /// and navigates to the Sign In page.
  Future<void> skipOnboarding() async {
    await AppConstant.sharedPreferences!.setBool(
      AppString.onboardingViewedKey,
      true,
    );
    Get.offNamed(RoutesName.signInPage);
  }

  /// Goes to the next onboarding page.
  ///
  /// If already on the last page, it skips onboarding instead.
  Future<void> nextPageOrSkip() async {
    final bool isLastPage =
        currentIndex.value == OnBoardingListData.getOnboardingData.length - 1;
    if (isLastPage) {
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
    // Dispose the PageController to free resources.
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
