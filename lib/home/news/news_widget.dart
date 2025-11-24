import 'package:flutter/material.dart';
import 'package:news/home/news/news_item.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:shimmer/shimmer.dart';

import '../../api/dio_api_manger.dart';

class NewsWidget extends StatefulWidget {
  final Source source;
  const NewsWidget({super.key,required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    var dio = DioApiManager();
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    return FutureBuilder<NewsResponse>(
      future: dio.getNewsBySourceId(widget.source.id ?? ''),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.028,
                    vertical: height * 0.01,
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: width * 0.028,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: height * 0.25,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        Container(
                          height: 20,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          height: 20,
                          width: width * 0.6,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 12,
                              width: width * 0.3,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            Container(
                              height: 12,
                              width: width * 0.2,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }else if(snapshot.hasError){
            return Column(
              children: [
                Text('SomeThing Went Wrong',
                style: Theme.of(context).textTheme.labelMedium),
                ElevatedButton(onPressed: (){
                  dio.getNewsBySourceId(widget.source.id ?? '');
                  setState(() {

                  });
                }, child: Text('Try Again',
                style: Theme.of(context).textTheme.labelMedium,))
              ],
            );
          }
          if(snapshot.data!.status != 'ok'){
            return Column(
              children: [
                Text(snapshot.data!.message!,
                    style: Theme.of(context).textTheme.labelMedium),
                ElevatedButton(onPressed: (){
                  dio.getNewsBySourceId(widget.source.id ?? '');
                  setState(() {

                  });
                }, child: Text('Try Again',
                  style: Theme.of(context).textTheme.labelMedium,))
              ],
            );
          }
          if (snapshot.data!.articles!.isEmpty) {
            return Center(
              child: Text('Ops No News Here.',
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineLarge,),
            );
          }
          var newsList = snapshot.data?.articles ?? [];
          return ListView.separated(
            padding: EdgeInsets.only(top: height * 0.02),
            separatorBuilder: (context, index) =>
                SizedBox(height: height * 0.02,),
              itemBuilder: (context, index) {
                return NewsItem(news: newsList[index]);
              },
            itemCount: newsList.length,
          );
        },
    );
  }
}
