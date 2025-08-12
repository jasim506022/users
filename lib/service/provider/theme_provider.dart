import 'package:flutter/material.dart';

import '../../res/app_constant.dart';
import '../../res/app_string.dart';


/// A ChangeNotifier that manages and persists the app's theme mode.
class ThemeModeProvider with ChangeNotifier {
  /// Current theme state (true = dark mode)
  bool _isDarkMode = false;

  /// Returns the current theme mode status
  bool get isDarkTheme => _isDarkMode;

  /// Sets and saves the user's theme preference
  Future<void> updateThemeMode(bool isDark) async {
    await AppConstant.sharedPreferences?.setBool(
      AppString.themeStatusKey,
      isDark,
    );
    _isDarkMode = isDark;
    notifyListeners();
  }
}
