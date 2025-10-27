import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';

class DividerItem extends StatelessWidget {
  const DividerItem({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Divider(
      color: AppColor.whiteColor,
      thickness: 2,
      indent: width * 0.04,
      endIndent: width * 0.02,
    );
  }
}
