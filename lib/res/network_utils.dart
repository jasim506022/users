import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_colors.dart';
import 'app_string.dart';

/// A utility class for checking network connectivity and handling no-internet scenarios.
class NetworkUtils {
  static final Connectivity _connectivity = Connectivity();

  /// Executes a function only if the internet is available, otherwise shows a snackbar.
  static Future<void> executeWithInternetCheck({
    required VoidCallback action,
  }) async {
    if (await _hasInternet()) {
      action();
    } else {
      _showNoInternetSnackbar();
    }
  }

  /// Checks if the device has an active internet connection.
  static Future<bool> _hasInternet() async {
    return await _connectivity.checkConnectivity() != ConnectivityResult.none;
  }

  /// Displays a snackbar when there is no internet.
  static void _showNoInternetSnackbar() {
    Get.snackbar(
      AppString.noInternet,
      AppString.noInternetMessage,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.black.withOpacity(.7),
      colorText: AppColors.white,
      duration: const Duration(seconds: 1),
      margin: EdgeInsets.zero,
      borderRadius: 0,
    );
  }
}

/*
2️⃣ Improve executeWithInternetCheck()
✅ Issue: VoidCallback action does not support async functions (like API calls).
✅ Fix: Use Future<void> Function() instead of VoidCallback.
*/


/*
/// A utility class for managing internet connectivity checks.
class NetworkUtili {
  // static Future<bool> verifyInternetStatus() async {
  //   final List<ConnectivityResult> connectivityResult =
  //       await (Connectivity().checkConnectivity());
  //   bool checkInternet = connectivityResult.contains(ConnectivityResult.none);
  //   if (checkInternet) {
  //     showNoInternetSnackbar();
  //   }
  //   return checkInternet;
  // }

  static Future<void> executeWithInternetCheck(
      {required Function function}) async {
    bool checkInternet = await _isOffline();
    if (checkInternet) {
      _showNoInternetSnackbar();
    } else {
      function;
    }
    // return checkInternet;
  }

  /// Checks if the device is offline.
  ///
  /// - Returns `true` if there’s no internet connection.
  static Future<bool> _isOffline() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    return connectivityResult.contains(ConnectivityResult.none);
  }

  /// Displays a snackbar notification when there’s no internet connection.
  static SnackbarController _showNoInternetSnackbar() {
    return Get.snackbar(AppString.noInternet, AppString.noInternetMessage,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.black.withOpacity(.7),
        colorText: AppColors.white,
        duration: const Duration(seconds: 1),
        margin: EdgeInsets.zero,
        borderRadius: 0);
  }

  // /// A utility function to verify internet status before executing an action
  // static Future<void> verifyInternetAndExecute(
  //     Future<void> Function() action) async {
  //   if (!await verifyInternetStatus()) {
  //     await action();
  //   }
  // }
}

*/