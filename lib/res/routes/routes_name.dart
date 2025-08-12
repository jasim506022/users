class RoutesName {
  // General Routes
  static const String splashPage = '/';
  static const String mainPage = '/mainPage';

  // Authentication Routes
  static const String signInPage = '/signInPage';
  static const String onboardingPage = '/onboardingPage'; // Fixed typo
  static const String signupPage = '/signUpPage'; // Standardized casing
  static const String forgetPasswordPage = '/forgetPassword';

  // Product and Search Routes
  static const String productListPage = '/products'; // Product Listing
  static const String productDetailsPage = '/productDetails';
  static const String searchPage = '/search';

  // Cart and Order Routes
  static const String cartPage = '/cart'; // User Shopping Cart
  static const String orderSummaryPage = '/orderSummary'; // Order Summary
  static const String orderDetailsPage = '/orderDetails'; // // Order Details
  static const String deliveryScreen = '/delivery'; //  Delivery Information
  static const String orderHistoryPage = '/orderHistory'; // Order History

  // Address and Billing Routes
  static const String addressPage = '/address'; // Billing/Shipping Address
  static const String billPage = '/billPage'; // Billing Details
  static const String orderConfirmationPage =
      '/orderConfirmation'; // after order confirmation

  // Profile Management Routes
  static const String userProfilePage = '/profile'; // User Profile
  static const String editProfilePage = '/editProfile'; // Edit User Profile
}
