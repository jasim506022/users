import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/splash_controller.dart';
import '../../res/app_asset/image_asset.dart';
import '../../widget/app_logo_widget.dart';

/// The splash screen displayed at app launch.
///
/// Shows a background image and the app logo while initializing the app.
/// Uses [SplashController] to manage initialization logic.

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    /// Controller for splash logic, injected via GetX.
    Get.find<SplashController>();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AppImage.splashBackgroundImagePath),
          ),
        ),

        /// Center widget centers its child within the available space.
        child: const Center(child: AppLogoWidget()),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/splash_controller.dart';

import '../../res/app_asset/image_asset.dart';
import '../../widget/app_logo_widget.dart';

/// SplashPage is the initial screen of the app that is displayed when the app is launched.
/// This screen typically displays a logo or an introductory image while the app initializes.
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Calling the SplashController to ensure it's loaded
    Get.find<SplashController>();
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          // Decoration to add background image to the container
          image: DecorationImage(
            fit: BoxFit.fill,
            // Makes sure the background image fills the entire container area
            image: AssetImage(AppImage.splashScreenBackground),
          ),
        ),
        // Center widget centers its child within the available space
        child: const Center(
          child: AppLogoWidget(),
        ),
      ),
    );
  }
}


 */
