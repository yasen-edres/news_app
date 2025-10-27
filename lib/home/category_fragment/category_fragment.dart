import 'package:flutter/material.dart';
import 'package:news/home/category_fragment/category_item.dart';
import 'package:news/model/category.dart';

class CategoryFragment extends StatelessWidget {
  CategoryFragment({super.key});

  List<Category> categoryList = [];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    categoryList = Category.getCategoriesList(false);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Good Morning\nHere is Some News For You",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: height * 0.02),
              itemBuilder: (context, index) {
                return CategoryItem(
                  category: categoryList[index],
                  index: index,
                );
              },
              separatorBuilder: (context, index) =>
                  SizedBox(height: height * 0.02),
              itemCount: 7,
            ),
          ),
        ],
      ),
    );
  }
}
