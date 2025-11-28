import 'package:flutter/material.dart';
import 'package:news/home/drawer/widget/app_config_item.dart';
import 'package:news/home/drawer/widget/divider_item.dart';
import 'package:news/home/drawer/widget/drawer_item.dart';
import 'package:news/provider/app_theme_provider.dart';
import 'package:news/utils/app_assets.dart';
import 'package:news/utils/app_color.dart';
import 'package:news/utils/app_styles.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatelessWidget {
  VoidCallback onDrawerItemClick;

  HomeDrawer({super.key, required this.onDrawerItemClick});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var appTheme = Provider.of<AppThemeProvider>(context);
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: height * 0.20,
          decoration: BoxDecoration(color: AppColor.whiteColor),
          child: Text('News App', style: AppStyle.medium24Black),
        ),
        InkWell(
            onTap: () {
              onDrawerItemClick();
            },
            child: DrawerItem(iconName: AppAsset.homeIcon, text: 'Go To Home')
        ),
        DividerItem(),
        DrawerItem(iconName: AppAsset.themeIcon, text: 'Theme'),
        InkWell(
            onTap: () {
              if (appTheme.appTheme == ThemeMode.light) {
                appTheme.changeTheme(ThemeMode.dark);
                return;
              }
              appTheme.changeTheme(ThemeMode.light);
            },
            child: AppConfigItem(name: appTheme.appTheme.name)),
        SizedBox(height: height * 0.04),
        DividerItem(),
        DrawerItem(iconName: AppAsset.languageIcon, text: 'Language'),
        AppConfigItem(name: 'English'),
      ],
    );
  }
}
