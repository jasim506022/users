import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/onboarding_controller.dart';
import '../../../data/onboarding_list_data.dart';
import '../../../model/onboard_model.dart';
import '../../../res/apps_text_style.dart';
import 'next_action_button.dart';
import 'onboarding_progress_dots_widget.dart';

/// Displays the content for each onboarding page, including the image, title,
/// description, progress dots, and the 'Next' button.
class OnboardingPageContentWidget extends StatelessWidget {
  const OnboardingPageContentWidget({super.key, required this.onboardModel});

  /// Data model containing onboarding page content.
  final OnboardModel onboardModel;

  @override
  Widget build(BuildContext context) {
    // Get the controller that manages onboarding logic and state
    final OnboardingController onboardingController =
        Get.find<OnboardingController>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Onboarding image with responsive height
        Image.asset(onboardModel.image, height: 300.h, fit: BoxFit.fill),

        // Progress indicator dots for onboarding pages
        const OnboardingProgressIndicator(),

        // Title of the current onboarding page
        Text(onboardModel.title, style: AppsTextStyle.largeTitle),

        // Description text with centered alignment and extra line height for readability
        Text(
          onboardModel.description,
          textAlign: TextAlign.center,
          style: AppsTextStyle.mediumBoldText.copyWith(height: 2),
        ),

        // Button to proceed to next page or skip onboarding
        NextActionButtonWidget(onTap: onboardingController.nextPageOrSkip),
      ],
    );
  }
}

/*
/// Displays the content for each onboarding page, including the image, title,
/// description, progress dots, and the 'Next' button.
class OnboardingPageContentWidget extends StatelessWidget {
  const OnboardingPageContentWidget({
    super.key,
    required this.onboardingItem,
  });

  /// The data model for the current onboarding page
  final OnboardModel onboardingItem;

  @override
  Widget build(BuildContext context) {
    final OnboardingController onboardingController =
        Get.find<OnboardingController>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /// Displays the onboarding image with responsive height.
        Image.asset(
          onboardingItem.image,
          height: 300.h,
          fit: BoxFit.fill,
        ),

        const OnboardingProgressDotsWidget(),

        /// Displays the onboarding title with centered alignment.
        Text(onboardingItem.title, style: AppsTextStyle.largeTitle),
        Text(onboardingItem.description,
            textAlign: TextAlign.center,
            style: AppsTextStyle.mediumBoldText.copyWith(height: 2)),

        /// Displays the 'Next' button to navigate through onboarding pages.
        NextActionButton(
          title: AppString.btnNext,
          onTap: onboardingController.goToNextPageOrSkip,
        ),
      ],
    );
  }
}

/*
/// Displays the content for each onboarding page, including the image, title,
/// description, progress dots, and the 'Next' button.
*/


 */
