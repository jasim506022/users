import 'package:get/get.dart';
import 'package:users/controller/onboarding_controller.dart';

class OnBoardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingController>(() => OnboardingController());
  }
}
