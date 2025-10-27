import 'package:flutter/material.dart';
import 'package:news/model/category.dart';
import 'package:news/utils/app_color.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final int index;

  CategoryItem({super.key, required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
      child: Stack(
        alignment: index % 2 == 0
            ? Alignment.bottomRight
            : Alignment.bottomLeft,
        children: [
          Image.asset(category.image, fit: BoxFit.cover),
          Container(
            width: width * 0.40,
            margin: EdgeInsets.symmetric(
              horizontal: width * 0.04,
              vertical: height * 0.02,
            ),
            padding: EdgeInsetsDirectional.only(
              start: (index % 2 == 0) ? width * 0.02 : 0,
              end: (index % 2 == 0) ? 0 : width * 0.02,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(84),
              color: AppColor.grayColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: (index % 2 == 0)
                  ? TextDirection.ltr
                  : TextDirection.rtl,
              children: [
                Text(
                  'View All',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Icon(
                    (index % 2 == 0)
                        ? Icons.arrow_forward_ios_outlined
                        : Icons.arrow_back_ios_outlined,
                    size: 25,
                    color: Theme.of(context).splashColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
