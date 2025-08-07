import 'package:shared_preferences/shared_preferences.dart';

import '../model/paymentmodel.dart';

class AppConstant {
  /// SharedPreferences instance (  initialized in main)
  static SharedPreferences? sharedPreferences;

  /// Whether the onboarding screen has been viewed.
  static bool isOnboardingViewed = false;

  // Default settings and placeholders
  static const String defaultProfileImage =
      "https://firebasestorage.googleapis.com/v0/b/grocery-app-4ca36.appspot.com/o/blank%2Fno-profile-picture-15257%20(1).png?alt=media&token=8c031928-1578-4826-8289-0e3f62751627";

  // Stripe publishable key
  static const String publishKey =
      'pk_test_51NxWNQAVUbXW3f6RWMGhMJhUO0udDaNswK3RRuIo817qEyN28xcXHMTPHIOnj27ah0giitHaEsgqvHOxbcoNbAWC00Z6GYb1Rv';

  // Predefined lists
  static const List<String> cateogryTypes = <String>[
    "All",
    'Fruits',
    'Vegatables',
    'Dairy & Egg',
    'Dry & Canned',
    "Drinks",
    "Meat & Fish",
    "Candy & Chocolate"
  ];
  static const List<String> addressTypes = <String>['Home', 'Office', 'Other'];
  static const List<String> unitTypes = <String>[
    'Per Kg',
    'Per Dozen',
    'Litter',
    'Pc',
    'Pcs',
  ];

  // User rating
  static double starRating = 0.0;
  static String ratingTitle = "";

  // Optional viewed status (with default)
  static int? isViewed;
// late Size mq;

  double countStarRatting = 0.0;
  String titleRating = "";

  // Payment options
  static List<PaymentModel> paymentTypes = [
    PaymentModel(icon: "asset/payment/visa.png", title: "Card"),
    PaymentModel(icon: "asset/payment/bkash.png", title: "Bkash"),
  ];
}

enum Payment { card, bkash }
