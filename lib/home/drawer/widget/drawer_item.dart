import 'package:flutter/cupertino.dart';
import 'package:news/utils/app_color.dart';
import 'package:news/utils/app_styles.dart';

class DrawerItem extends StatelessWidget {
  final String iconName;
  final String text;

  const DrawerItem({super.key, required this.iconName, required this.text});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.02,
      ),
      child: Row(
        children: [
          Image.asset(iconName, color: AppColor.whiteColor),
          SizedBox(width: width * 0.02),
          Text(text, style: AppStyle.bold20White),
        ],
      ),
    );
  }
}
