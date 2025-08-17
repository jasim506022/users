import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../res/app_function.dart';
import '../res/apps_text_style.dart';
import 'custom_text_field_decoration.dart';

/// A reusable custom text form field with label, validation,
/// password toggle, and optional custom decoration.
///
/// Supports:
/// - Email, password, and general text input
/// - Validation via [validator]
/// - Password visibility toggle with [hasPasswordToggle]
/// - Custom [decoration] or default consistent styling

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.label,
    this.autofocus = false,
    this.enabled = true,
    this.obscureText = false,
    this.hasPasswordToggle = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines = 1,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.decoration,
    this.style,
    this.autofillHints,
  });

  /// Placeholder text inside the field
  final String hintText;
  /// Optional label displayed above the field
  final String? label;
  /// Text editing controller
  final TextEditingController controller;
  /// Autofocus on field load
  final bool autofocus;
  /// Whether the field is enabled
  final bool enabled;

  /// Whether the text should be obscured (e.g., for passwords)
  final bool obscureText;
  /// Whether to show a password toggle button
  final bool hasPasswordToggle;
  /// Action button on the keyboard (Next, Done, etc.)
  final TextInputAction? textInputAction;
  /// Keyboard input type (email, number, etc.)
  final TextInputType textInputType;
  /// Maximum number of lines (ignored if [obscureText] is true)
  final int maxLines;

  /// Validator for form validation
  final String? Function(String?)? validator;
  /// Called when text changes
  final Function(String)? onChanged;

  /// Called when user submits the field (e.g., presses Done/Enter)
  final Function(String)? onFieldSubmitted;
  /// Custom input decoration (if not provided, default is applied)
  final InputDecoration? decoration;
  /// Custom text style
  final TextStyle? style;

  /// Autofill hints (e.g., [AutofillHints.email], [AutofillHints.password])
  final List<String>? autofillHints;


  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  /// Controls password visibility when [hasPasswordToggle] is enabled
  late bool _obscureText;

  @override
  void initState() {
    /// Initializes `_obscureText` based on the widget's `obscureText` property.
    _obscureText = widget.hasPasswordToggle ? true : widget.obscureText;
    super.initState();
  }

  /// Toggles the visibility of password text
  void _togglePasswordVisibility() {
    setState(() => _obscureText = !_obscureText);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.label != null
          ? EdgeInsets.symmetric(vertical: 10.h)
          : EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Displays the label if provided.
          if (widget.label != null)
            Text(widget.label!, style: AppsTextStyle.labelTextStyle),

          /// Adds spacing between label and input field.
          AppsFunction.verticalSpacing(8),
          TextFormField(
            onChanged: widget.onChanged,
            enabled: widget.enabled,
            controller: widget.controller,
            autofocus: widget.autofocus,
            maxLines: widget.maxLines,
            validator: widget.validator,
            obscureText: _obscureText,
            textInputAction: widget.textInputAction,
            keyboardType: widget.textInputType,
            autofillHints: widget.autofillHints,
            onFieldSubmitted: widget.onFieldSubmitted,
            style:
                widget.style ??
                AppsTextStyle.textFieldInputTextStyle(widget.enabled),

            /// Applies custom or default decoration
            decoration:
                widget.decoration ??
                CustomTextFieldDecoration.inputDecoration(
                  isEnable: widget.enabled,
                  hintText: widget.hintText,
                  isShowPassword: widget.hasPasswordToggle,
                  isPasswordObscured: _obscureText,
                  onPasswordToggle: widget.hasPasswordToggle
                      ? _togglePasswordVisibility
                      : null,
                ),
          ),
        ],
      ),
    );
  }
}


