import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/home/category_details/sources_tab_widget.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/model/category.dart';
import 'package:news/utils/app_color.dart';

class CategoryDetails extends StatefulWidget {
  final Category category;

  const CategoryDetails({super.key, required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: FutureBuilder<SourceResponse>(
        future: ApiManager.getSources(categoryId: widget.category.id),
          builder: (context, snapshot) {
            //todo: loading
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(
                  color: AppColor.grayColor,
                ),
              );
            }
            //todo: error => client
            else if(snapshot.hasError){
              return Column(
                children: [
                  Text('Something Went Wrong'),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.grayColor
                    ),
                    onPressed: (){
                      ApiManager.getSources(categoryId: widget.category.id);
                      setState(() {
      
                      });
                    }, child: Text('Try Again',
                    style: Theme.of(context).textTheme.labelMedium,
                  ))
                ],
              );
            }
            //todo: server => response => success , error
            if(snapshot.data?.status != 'ok'){
              return Column(
                children: [
                  Text(snapshot.data!.message!,
                  style: Theme.of(context).textTheme.labelMedium,),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.grayColor
                      ),
                      onPressed: (){
                        ApiManager.getSources(categoryId: widget.category.id);
                        setState(() {
      
                        });
                      }, child: Text('Try Again',
                    style: Theme.of(context).textTheme.labelMedium,
                  ))
                ],
              );
            }
            //todo: server => response => success
            var sourcesList = snapshot.data?.sources ?? [];
            return SourcesTabWidget(sourcesList: sourcesList);
          },
      ),
    );
  }
}
