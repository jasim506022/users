import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:users/res/app_string.dart';

import '../../controller/profile_controller.dart';
import '../../res/app_colors.dart';
import '../../res/apps_text_style.dart';
import '../../res/routes/routes_name.dart';
import '../../service/provider/theme_provider.dart';
import '../../widget/show_alert_dialog_widget.dart';
import '../../res/network_utils.dart';
import 'widget/custom_list_tile.dart';
import 'widget/profile_header_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final profileController = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.profile),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings_outlined,
                size: 25.h,
              ))
        ],
      ),
      body: Column(
        children: [
          const ProifleHeaderWidget(),
          Expanded(
            child: ListView(
              children: [
                Divider(
                  height: 10.h,
                  color: Theme.of(context).hintColor,
                  thickness: 2,
                ),
                _buildProfileMenuItems(context),
                _buildThemeSwitch(context),
                _buildSignOutTile()
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Dynamically build list of profile menu items
  Widget _buildProfileMenuItems(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {
        "icon": Icons.info_outline,
        "title": AppString.about,
        "route": RoutesName.editProfilePage
      },
      {
        "icon": Icons.home_outlined,
        "title": AppString.home,
        "route": RoutesName.mainPage,
        "argument": 0
      },
      {
        "icon": Icons.reorder,
        "title": AppString.myOrder,
        "route": RoutesName.orderSummaryPage
      },
      {
        "icon": Icons.access_time,
        "title": AppString.history,
        "route": RoutesName.orderHistoryPage
      },
      {
        "icon": Icons.search,
        "title": AppString.search,
        "route": RoutesName.mainPage,
        "argument": 2
      },
    ];

    return Column(
      children: menuItems.map((item) {
        return CustomListTile(
          icon: item['icon'],
          title: item['title'],
          onTap: () async {
            NetworkUtils.executeWithInternetCheck(action: () {
              if (item['argument'] is int) {
                Get.offAndToNamed(item['route'], arguments: item['argument']);
              } else {
                Get.toNamed(item['route']);
              }
            });

/*
            if (!(await NetworkUtili.verifyInternetStatus())) {
              if (item['argument'] is int) {
                Get.offAndToNamed(item['route'], arguments: item['argument']);
              } else {
                Get.toNamed(item['route']);
              }
            }
*/
          },
        );
      }).toList(),
    );
  }

  // Build theme switcher widget
  Widget _buildThemeSwitch(BuildContext context) {
    return Consumer<ThemeModeProvider>(
      builder: (context, themeProvider, child) {
        return SwitchListTile(
          secondary: Icon(
            themeProvider.isDarkTheme ? Icons.dark_mode : Icons.light_mode,
            color: themeProvider.isDarkTheme
                ? AppColors.white
                : Theme.of(context).primaryColor,
            size: 25.h,
          ),
          title: Text(
            themeProvider.isDarkTheme ? AppString.dark : AppString.light,
            style: AppsTextStyle.largeBoldText,
          ),
          activeColor: AppColors.white,
          onChanged: (bool value) {
            themeProvider.updateThemeMode(value);    // = value;
          },
          value: themeProvider.isDarkTheme,
        );
      },
    );
  }

  Widget _buildSignOutTile() {
    return CustomListTile(
      icon: Icons.exit_to_app,
      title: AppString.signOut,
      iconColor: AppColors.red,
      onTap: () async {
        NetworkUtils.executeWithInternetCheck(action: () {
          Get.dialog(ShowAlertDialogWidget(
            icon: Icons.delete,
            title: AppString.signOut,
            content: AppString.doYouWantSignount,
            onConfirmPressed: () async => await profileController.signOut(),
          ));
        });
        /*
        if (!(await NetworkUtili.verifyInternetStatus())) {

          Get.dialog(ShowAlertDialogWidget(
            icon: Icons.delete,
            title: AppString.signOut,
            content: AppString.doYouWantSignount,
            onYesPressed: () async => await profileController.signOut(),
          ));
          
        }

        */
      },
    );
  }
}
