import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'bindings/initial_binding.dart';
import 'res/routes/app_routes.dart';
import 'res/routes/routes_name.dart';
import 'service/provider/theme_provider.dart';
import 'res/app_theme.dart';

/// The root widget of the application.
///
/// Initializes screen size configuration, theme provider,
/// and sets up GetX routing and bindings.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // Set the design size for responsive layout
      designSize: const Size(450, 851),
      builder: (_, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => ThemeModeProvider()),
          ],
          child: Consumer<ThemeModeProvider>(
            builder: (_, themeProvider, _) => GetMaterialApp(
              // Initialize GetX bindings
            initialBinding: InitialBinding(),
              debugShowCheckedModeBanner: false,
              theme: AppTheme(isDark: themeProvider.isDarkTheme).build(),
              initialRoute: RoutesName.splashPage,
              getPages: AppRoutes.appRoutes(),
            ),
          ),
        );
      },
    );
  }
}
