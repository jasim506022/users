import 'package:firebase_auth/firebase_auth.dart';
import 'package:users/res/app_function.dart';
import 'package:users/res/app_string.dart';

import '../data/service/data_firebase_service.dart';
import '../res/app_constant.dart';
import '../service/provider/data_authentication_service.dart';


/*
class SplashRepository {
  final DataFirebaseService _dataFirebaseService = DataFirebaseService();

  User? getCurrentUser() {
    try {
      return _dataFirebaseService.getCurrentUser();
    } catch (e) {
      AppsFunction.handleException(e);
      rethrow;
    }
  }

  Future<int?> getOnboardingStatus() async {
    return AppConstant.sharedPreferences!.getInt(AppString.onBoardingSharedPre);
  }
}


 */


/// Handles authentication-related data for the splash screen.
class SplashRepository {
  // Instance of Firebase service to get user data.
  final  FirebaseAuthenticationService firebaseAuthenticationService = FirebaseAuthenticationService();

  /// Fetches the currently logged-in user from Firebase.
  User? getCurrentUser() {
    try {
      return firebaseAuthenticationService.getCurrentUser();
    } catch (e) {
      AppsFunction.handleException(e);
      rethrow;
    }
  }
}

