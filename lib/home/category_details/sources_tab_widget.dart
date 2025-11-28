import 'package:flutter/material.dart';
import 'package:news/home/category_details/widget/source_name.dart';
import 'package:news/home/news/news_widget.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/utils/app_color.dart';

class SourcesTabWidget extends StatefulWidget {
  List<Source> sourcesList;
  SourcesTabWidget({super.key,required this.sourcesList});

  @override
  State<SourcesTabWidget> createState() => _SourcesTabWidgetState();
}

class _SourcesTabWidgetState extends State<SourcesTabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourcesList.length,
        child: Column(
          children: [
            TabBar(
              tabAlignment: TabAlignment.start,
              indicatorColor: Theme.of(context).splashColor,
              dividerColor: AppColor.transparentColor,
              isScrollable: true,
                onTap: (index){
                selectedIndex = index;
                setState(() {

                });
                },
                tabs: widget.sourcesList.map((source) {
              return SourceName(
                  source: source,
                  isSelected: selectedIndex == widget.sourcesList.indexOf(source)
              );
            },).toList()),
            Expanded(child: NewsWidget(source: widget.sourcesList[selectedIndex])),
          ],
        ),
    );
  }
}
