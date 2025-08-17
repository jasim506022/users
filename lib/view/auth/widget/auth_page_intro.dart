import 'package:flutter/cupertino.dart';

import '../../../res/app_function.dart';
import '../../../res/apps_text_style.dart';
import '../../../widget/app_logo_widget.dart';

/// A reusable intro section for authentication screens (e.g., Sign In, Sign Up, Forgot Password).
///
/// Features:
/// - Displays a logo or custom widget
/// - Title and description with consistent styling
/// - Configurable text alignment and spacing
class AuthIntroWidget extends StatelessWidget {
  const AuthIntroWidget({
    super.key,
    required this.title,
    required this.description,
    this.customWidget,
  });

  final String title;
  final String description;

  /// An optional custom widget (e.g., an image or illustration).
  /// If not provided, it defaults to `AppLogoWidget`
  final Widget? customWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppsFunction.verticalSpacing(50),

        // Logo or custom widget
        customWidget ?? const AppLogoWidget(),
        AppsFunction.verticalSpacing(10),
        Text(
          title,
          style: AppsTextStyle.authIntroTitleTextStyle,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        AppsFunction.verticalSpacing(10),
        Text(
          description,
          textAlign: TextAlign.center,
          style: AppsTextStyle.authIntroDescriptionTextStyle,
          softWrap: true,
        ),
        AppsFunction.verticalSpacing(40),
      ],
    );
  }
}
