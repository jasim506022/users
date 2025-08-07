
import '../model/onboard_model.dart';
import '../res/app_asset/image_asset.dart';

import '../res/app_string.dart';

class OnBoardingListData {
  /// Returns a list of onboarding models with image, title, and description.
  static List<OnboardModel> getOnboardingData = [
        OnboardModel(
          image: AppImage.onboardingFirstImage,
          title: AppString.onboardingTitle1,
          description: AppString.onboardingDescription1,
        ),
        OnboardModel(
          image: AppImage.onboardingSecondImage,
          title: AppString.onboardingTitle2,
          description: AppString.onboardingDescription2,
        ),
        OnboardModel(
          image: AppImage.onboardingThirdImage,
          title: AppString.onboardingTitle3,
          description: AppString.onboardingDescription3,
        )
      ];
}
