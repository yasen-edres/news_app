import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/home/drawer/widget/app_config_item.dart';
import 'package:news/home/drawer/widget/divider_item.dart';
import 'package:news/home/drawer/widget/drawer_item.dart';
import 'package:news/utils/app_assets.dart';
import 'package:news/utils/app_color.dart';
import 'package:news/utils/app_styles.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: height * 0.20,
          decoration: BoxDecoration(color: AppColor.whiteColor),
          child: Text('News App', style: AppStyle.medium24Black),
        ),
        DrawerItem(iconName: AppAsset.homeIcon, text: 'Go To Home'),
        DividerItem(),
        DrawerItem(iconName: AppAsset.themeIcon, text: 'Theme'),
        AppConfigItem(name: 'Dark'),
        SizedBox(height: height * 0.04),
        DividerItem(),
        DrawerItem(iconName: AppAsset.languageIcon, text: 'Language'),
        AppConfigItem(name: 'English'),
      ],
    );
  }
}
