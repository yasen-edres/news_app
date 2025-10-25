import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/utils/app_color.dart';

class NewsWidget extends StatefulWidget {
  final Source source;
  const NewsWidget({super.key,required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
        future: ApiManager.getNewsBySourceId(widget.source.id ?? ''),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color: AppColor.grayColor,
              ),
            );
          }else if(snapshot.hasError){
            return Column(
              children: [
                Text('SomeThing Went Wrong',
                style: Theme.of(context).textTheme.labelMedium),
                ElevatedButton(onPressed: (){
                  ApiManager.getNewsBySourceId(widget.source.id ?? '');
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
                  ApiManager.getNewsBySourceId(widget.source.id ?? '');
                  setState(() {

                  });
                }, child: Text('Try Again',
                  style: Theme.of(context).textTheme.labelMedium,))
              ],
            );
          }
          var newsList = snapshot.data?.articles ?? [];
          return ListView.builder(
              itemBuilder: (context, index) {
                return Text(newsList[index].title ?? '',
                 style: Theme.of(context).textTheme.labelMedium,);
              },
            itemCount: newsList.length,
          );
        },
    );
  }
}
