import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';
import 'package:users/res/app_colors.dart';

import 'package:users/res/routes/routes_name.dart';
import 'package:users/service/provider/theme_provider.dart';

import 'bindings/initial_binding.dart';
import 'res/routes/app_routes.dart';
import 'theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // Set the design size for responsive layout

    designSize: const Size(450, 851),
      builder: (_, child) {
        return MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => ThemeModeProvider())],
          child: Consumer<ThemeModeProvider>(
            builder: (context, themeProvider, child) =>
               GetMaterialApp(
                 // Set initial bindings (like controllers
                initialBinding: InitialBinding(),
                debugShowCheckedModeBanner: false,
                 theme: AppTheme(isDark: themeProvider.isDarkTheme).build(),
                initialRoute: RoutesName.splashPage,
                getPages: AppRoutes.appRoutes(),
                // home: HomeScreenPage(),
              )

          ),
        );
      },
    );
  }




}
