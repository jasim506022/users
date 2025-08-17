import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';
import '../../res/app_asset/icon_asset.dart';
import '../../res/app_function.dart';

import '../../res/app_colors.dart';
import '../../res/app_string.dart';
import '../../res/apps_text_style.dart';
import '../../res/routes/routes_name.dart';
import '../../res/app_validator.dart';

import '../../widget/rich_text_widget.dart';
import '../../widget/custom_text_form_field.dart';
import '../../res/network_utils.dart';
import 'widget/auth_button.dart';
import 'widget/auth_page_intro.dart';
import 'widget/social_button.dart';

/// A sign-in page where users can log in with email/password or social accounts.
class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  /// Controller for handling authentication-related logic
  late final AuthController _authController;

  /// Form key for validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    /// Get the `AuthController` instance for managing authentication.
    _authController = Get.find<AuthController>();
    _configureStatusBar();
    super.initState();
  }

  /// Configures the system UI to set the status bar color and icon brightness.
  void _configureStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.backgroundLight,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult:
          // Prevents accidental app exit without confirmation.
          (didPop, dynamic) => _authController.handleExitRequest(),
      child: GestureDetector(
        // Dismiss keyboard when tapping outside.
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// Displays an introduction (title & description).
                const AuthIntroWidget(
                  title: AppString.userLoginTitle,
                  description: AppString.authPageDescription,
                ),

                /// Displays the form.
                _loginForm(),
                AppsFunction.verticalSpacing(5),

                /// "Forgot Password" button.
                _forgotPasswordButton(),
                AppsFunction.verticalSpacing(15),

                /// Login Button  Button.
                AuthButton(
                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) return;
                    await _authController.signIn();
                  },
                  label: AppString.signInTitle,
                ),
                AppsFunction.verticalSpacing(25),

                /// OR divider section.
                orDivider(),
                AppsFunction.verticalSpacing(20),

                /// Social login buttons (Google & Facebook)
                _socialLoginRow(),
                AppsFunction.verticalSpacing(25),

                /// Sign-up link with navigation to the registration page.
                RichTextWidget(
                  highlightedText: AppString.createAccount,
                  onTap: () => Get.toNamed(RoutesName.signupPage),
                  normalText: AppString.dontHaveAccount,
                ),
                AppsFunction.verticalSpacing(100),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// A login form with email and password fields, including validation.
  ///
  /// - Validates email format
  /// - Allows password visibility toggle
  /// - Uses [_formKey] for form validation
  Form _loginForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          /// Email input field
          CustomTextFormField(
            label: AppString.emailLabel,
            hintText: AppString.emailHint,
            controller: _authController.emailController,
            validator: Validators.validateEmail,
            textInputType: TextInputType.emailAddress,
            autofillHints: const [AutofillHints.email],
          ),

          /// Password input field
          CustomTextFormField(
            label: AppString.passwordLabel,
            hintText: AppString.passwordHint,
            controller: _authController.passwordController,
            validator: Validators.validatePassword,
            hasPasswordToggle: true,
            obscureText: true,
            textInputAction: TextInputAction.done,
            autofillHints: const [AutofillHints.password],
          ),
        ],
      ),
    );
  }

  /// Returns a "Forgot Password" button aligned to the top-right.
  ///
  /// When pressed, checks internet connectivity before navigating
  /// to the Forget Password page.
  Widget _forgotPasswordButton() {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
        onPressed: () => NetworkUtils.executeWithInternetCheck(
          action: () => Get.toNamed(RoutesName.forgetPasswordPage),
        ),
        child: Text(
          AppString.forgetPasswordTitle,
          style: AppsTextStyle.mediumBoldText.copyWith(
            color: AppColors.hintLight,
          ),
        ),
      ),
    );
  }

  /// Builds a divider with "OR" text in the center.
  Row orDivider() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _dividerLine(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Text(
            AppString.withOr,
            style: AppsTextStyle.mediumNormalText.copyWith(
              color: AppColors.grey,
            ),
          ),
        ),
        _dividerLine(),
      ],
    );
  }

  /// Builds a row of social login buttons (Facebook, Google, etc.).
  ///
  /// Each button is evenly spaced and customizable via [SocialButton].
  Row _socialLoginRow() {
    return Row(
      children: [
        Expanded(
          /// Facebook login button.
          child: SocialButton(
            onTap: () {
              // TODO: Implement Facebook login
            },
            color: AppColors.facebookBlue,
            iconPath: AppIcons.facebookIcon,
            label: AppString.btnFacebook,
          ),
        ),
        AppsFunction.horizontalSpacing(10),
        Expanded(
          /// Facebook login button.
          child: SocialButton(
            onTap: () async => await _authController.signInWithGoogle(),
            color: AppColors.red,
            iconPath: AppIcons.gmailIcon,
            label: AppString.btnGmail,
          ),
        ),
      ],
    );
  }

  /// Builds a horizontal line for the divider.
  Container _dividerLine() {
    return Container(height: 2.5.h, width: 70.w, color: AppColors.grey);
  }
}
