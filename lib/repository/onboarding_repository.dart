import 'package:users/res/app_string.dart';

import '../res/app_constant.dart';

class OnBoardingRepository {
  Future<void> setOnboardingViewed() async {
    await AppConstant.sharedPreferences!
        .setInt(AppString.onBoardingSharedPre, 0);
  }
}
