import 'dart:developer' as developer;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';
import 'my_app.dart';
import 'res/app_constant.dart';
import 'res/app_string.dart';

/// Entry point of the application.
///
/// Initializes Flutter bindings, Stripe, Firebase,
/// SharedPreferences, and sets up background message handling.
Future<void> main() async {
  // Ensure the widgets are bound to the platform and Firebase is initialized.
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the Stripe payment system with the publishable key.
  Stripe.publishableKey = AppConstant.publishKey;

  //Initialize Firebase
  await _initializeFirebase();

  // Load shared preferences and onboarding status
  await _initializePreferences();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MyApp());
}

/// Firebase Initialization with error handling
Future<void> _initializeFirebase() async {
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e, stackTrace) {
    developer.log("Firebase initialization failed: $e", stackTrace: stackTrace);
  }
}

/// Firebase Initialization with error handling
Future<void> _initializePreferences() async {
  try {
    AppConstant.sharedPreferences = await SharedPreferences.getInstance();
    // Check onboarding status
    AppConstant.isOnboardingViewed =
        AppConstant.sharedPreferences?.getBool(AppString.onboardingViewedKey) ??
        false;
  } catch (e) {
    developer.log("Error loading SharedPreferences: $e");
  }
}

/// Handles Firebase background messages.
///
/// This function is triggered when the app receives
/// a push notification while in the background.
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  try {
    developer.log("Background Message Data: ${message.data}");
    if (message.notification != null) {
      developer.log("Title: ${message.notification?.title}");
      developer.log("Body: ${message.notification?.body}");
    }
  } catch (e) {
    developer.log("Error handling background message: $e");
  }
}
