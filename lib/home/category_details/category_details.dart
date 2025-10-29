import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/home/category_details/sources_tab_widget.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/model/category.dart';
import 'package:news/utils/app_color.dart';
import 'package:shimmer/shimmer.dart';

class CategoryDetails extends StatefulWidget {
  final Category category;

  const CategoryDetails({super.key, required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(

      body: FutureBuilder<SourceResponse>(
        future: ApiManager.getSources(categoryId: widget.category.id),
          builder: (context, snapshot) {
            //todo: loading
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
