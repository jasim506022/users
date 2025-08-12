import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../model/app_exception.dart';
import '../repository/splash_repository.dart';
import '../res/app_constant.dart';
import '../res/app_string.dart';
import '../res/app_asset/icon_asset.dart';
import '../res/routes/routes_name.dart';
import '../widget/error_dialog_widget.dart';

/// Controller for managing splash screen behavior.
///
/// Responsibilities:
/// - Sets immersive (full-screen) UI mode during splash.
/// - Decides navigation based on authentication & onboarding status.
/// - Handles and displays errors gracefully.

class SplashController extends GetxController {
  /// Handles authentication & app state checks.
  final SplashRepository splashRepository;

  /// Creates a [SplashController] with the required repository.
  SplashController({required this.splashRepository});

  @override
  void onInit() {
    _configureImmersiveUI();
    _navigateToNextPage();

    super.onInit();
  }

  /// Enables full-screen immersive mode for splash.
  void _configureImmersiveUI() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  /// Determines and navigates to the next page after splash delay.
  Future<void> _navigateToNextPage() async {
    try {
      // Delay for 2 seconds to simulate a splash effect
      await Future.delayed(Duration(seconds: 2));

      // check user
      User? currentUser = splashRepository.getCurrentUser();

      // Decide route based on login & onboarding status.
      final String nextRoute = (currentUser != null)
          ? RoutesName.mainPage
          : (!AppConstant.isOnboardingViewed
          ? RoutesName.onboardingPage
          : RoutesName.signInPage);

      // Navigate and remove splash from back stack.
      Get.offNamed(nextRoute);
    } catch (e) {
      if (e is AppException) {
      _showErrorDialog(e);
      }
    }
  }

  /// Displays an error dialog for [AppException].
  void _showErrorDialog(AppException error) {
    Get.dialog(
      ErrorDialogWidget(
        icon: AppIcons.warningIconPath,
        title: error.title!,
        content: error.message,
        buttonText: AppString.btnOkay,
      ),
    );
  }


  @override
  void onClose() {
    // Restore system UI when splash is closed.
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    super.onClose();
  }



}

/*
/// `SplashController` handles the logic for the splash page, including navigation
/// and UI configuration. It determines whether the user should go to the main page,
/// onboarding, or sign-in page.
class SplashController extends GetxController {
  /// Repository to manage user-related operations.
  SplashRepository repository;

  SplashController({required this.repository});

  @override
  void onInit() {
    // Navigate to the next page based on app logic
    _navigateToNextPage();

    _configureUI();
    super.onInit();
  }

  /// Determines the next page based on user authentication state and onboarding status.
  void _navigateToNextPage() {
    try {
      Future.delayed(
        // Delay for 2 seconds to simulate a splash effect
        const Duration(seconds: 2),
        () {
          var currentUser = repository.getCurrentUser();
          // Determine the next route based on user authentication and onboarding status
          final route = currentUser != null
              // If user is logged in, navigate to the main page
              ? AppRoutesName.mainPage
              : (AppConstant.isViewed != 0
                  ? AppRoutesName.onbordingScreen
                  : AppRoutesName.signInPage);
          // Navigate to the determined route and remove splash from history
          Get.offNamed(route);
        },
      );
    } catch (e) {
      if (e is AppException) {
        Get.dialog(
          ErrorDialogWidget(
            icon: AppIcons.warningIcon,
            title: e.title!,
            content: e.message,
            buttonText: AppString.btnOkay,
          ),
        );
      }
    }
  }

  @override
  void onClose() {
    // Restore system UI elements when the splash page is closed
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.onClose();
  }

  /// Configures the UI settings to make the splash page immersive (fullpage).
  void _configureUI() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode
          .immersive, // Hides the status and navigation bars for an immersive experience
    );
  }
}


 */
