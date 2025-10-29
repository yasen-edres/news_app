import 'package:flutter/material.dart';
import 'package:news/home/category_details/category_details.dart';
import 'package:news/home/category_fragment/category_fragment.dart';
import 'package:news/home/drawer/home_drawer.dart';
import 'package:news/home/search/search_screen.dart';
import 'package:news/model/category.dart';
import 'package:news/utils/app_color.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Theme
                .of(context)
                .splashColor
        ),
        title: Text(
            selectedCategory == null ?
            'Home' :
            '${selectedCategory!.id}'),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: Search(),
                );
              },
              icon: Icon(
                Icons.search_outlined,
              ))
        ],
      ),
      drawer: Drawer(
        backgroundColor: AppColor.blackColor,
        child: HomeDrawer(onDrawerItemClick: onDrawerItemClick,
        ),
      ),
      body: selectedCategory == null ?
      CategoryFragment(onCategoryItemClick: onCategoryItemClick,) :
      CategoryDetails(category: selectedCategory!,),
    );
  }

  Category? selectedCategory;

  void onCategoryItemClick(Category newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {

    });
  }

  void onDrawerItemClick() {
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {

    });

  }
}
