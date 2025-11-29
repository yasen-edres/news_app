import 'package:flutter/material.dart';
import 'package:news/api/dio_api_manger.dart';
import 'package:news/home/category_details/category_details_view_model.dart';
import 'package:news/home/category_details/sources_tab_widget.dart';
import 'package:news/model/category.dart';
import 'package:news/utils/app_color.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class CategoryDetails extends StatefulWidget {
  final Category category;

  const CategoryDetails({super.key, required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    var dio = DioApiManager();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (BuildContext context) => viewModel,
        child: Consumer<CategoryDetailsViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.errorMessage != null) {
              //todo: error
              return Center(
                child: Column(
                  children: [
                    Text(
                      viewModel.errorMessage!,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.grayColor,
                      ),
                      onPressed: () {
                        viewModel.getSources(widget.category.id);
                      },
                      child: Text(
                        'Try Again',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  ],
                ),
              );
            } else if (viewModel.sourcesList == null) {
              //todo: loading
              return ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.028,
                      vertical: height * 0.01,
                    ),
                    margin: EdgeInsets.symmetric(horizontal: width * 0.028),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300, width: 2),
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
            } else {
              //todo:success
              return SourcesTabWidget(sourcesList: viewModel.sourcesList!);
            }
          },
        ),
        // FutureBuilder<SourceResponse>(
        //   future: dio.getSources(categoryId: widget.category.id),
        //     builder: (context, snapshot) {
        //       //todo: loading
        //       if(snapshot.connectionState == ConnectionState.waiting){
        //         return ListView.builder(
        //           itemCount: 10,
        //           itemBuilder: (context, index) {
        //             return Container(
        //               padding: EdgeInsets.symmetric(
        //                 horizontal: width * 0.028,
        //                 vertical: height * 0.01,
        //               ),
        //               margin: EdgeInsets.symmetric(
        //                 horizontal: width * 0.028,
        //               ),
        //               decoration: BoxDecoration(
        //                 border: Border.all(
        //                   color: Colors.grey.shade300,
        //                   width: 2,
        //                 ),
        //                 borderRadius: BorderRadius.circular(16),
        //               ),
        //               child: Shimmer.fromColors(
        //                 baseColor: Colors.grey.shade300,
        //                 highlightColor: Colors.grey.shade100,
        //                 child: Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     Container(
        //                       height: height * 0.25,
        //                       width: double.infinity,
        //                       decoration: BoxDecoration(
        //                         color: Colors.grey.shade300,
        //                         borderRadius: BorderRadius.circular(8),
        //                       ),
        //                     ),
        //                     SizedBox(height: height * 0.01),
        //                     Container(
        //                       height: 20,
        //                       width: double.infinity,
        //                       decoration: BoxDecoration(
        //                         color: Colors.grey.shade300,
        //                         borderRadius: BorderRadius.circular(4),
        //                       ),
        //                     ),
        //                     SizedBox(height: 8),
        //                     Container(
        //                       height: 20,
        //                       width: width * 0.6,
        //                       decoration: BoxDecoration(
        //                         color: Colors.grey.shade300,
        //                         borderRadius: BorderRadius.circular(4),
        //                       ),
        //                     ),
        //                     SizedBox(height: height * 0.01),
        //                     Row(
        //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                       children: [
        //                         Container(
        //                           height: 12,
        //                           width: width * 0.3,
        //                           decoration: BoxDecoration(
        //                             color: Colors.grey.shade300,
        //                             borderRadius: BorderRadius.circular(4),
        //                           ),
        //                         ),
        //                         Container(
        //                           height: 12,
        //                           width: width * 0.2,
        //                           decoration: BoxDecoration(
        //                             color: Colors.grey.shade300,
        //                             borderRadius: BorderRadius.circular(4),
        //                           ),
        //                         ),
        //                       ],
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             );
        //           },
        //         );
        //       }
        //       else if(snapshot.hasError){
        //         String errorMessage;
        //         //todo: object => dio exception
        //         //todo: object dio exception => error => object app exception
        //         if (snapshot.error is DioException &&
        //             (snapshot.error as DioException).error is AppException
        //         ) {
        //           //todo: parsing DioException object => AppException object.
        //           errorMessage =
        //               ((snapshot.error as DioException).error as AppException)
        //                   .message;
        //         } else {
        //           errorMessage = snapshot.error.toString();
        //         }
        //         return Center(
        //           child: Column(
        //             children: [
        //               Text(errorMessage,
        //                 style: Theme
        //                     .of(context)
        //                     .textTheme
        //                     .headlineMedium,),
        //               ElevatedButton(
        //                   style: ElevatedButton.styleFrom(
        //                       backgroundColor: AppColor.grayColor
        //                   ),
        //                   onPressed: () {
        //                     dio.getSources(categoryId: widget.category.id);
        //                     setState(() {
        //
        //                     });
        //                   }, child: Text('Try Again',
        //                 style: Theme
        //                     .of(context)
        //                     .textTheme
        //                     .labelMedium,
        //               ))
        //             ],
        //           ),
        //         );
        //       }
        //       //todo: server => response => success , error
        //       if(snapshot.data?.status != 'ok'){
        //         return Center(
        //           child: Column(
        //             children: [
        //               Text(snapshot.data!.message!,
        //                 style: Theme
        //                     .of(context)
        //                     .textTheme
        //                     .labelMedium,),
        //               ElevatedButton(
        //                   style: ElevatedButton.styleFrom(
        //                       backgroundColor: AppColor.grayColor
        //                   ),
        //                   onPressed: () {
        //                     dio.getSources(
        //                         categoryId: widget.category.id);
        //                     setState(() {
        //
        //                     });
        //                   }, child: Text('Try Again',
        //                 style: Theme
        //                     .of(context)
        //                     .textTheme
        //                     .labelMedium,
        //               ))
        //             ],
        //           ),
        //         );
        //       } else if (snapshot.hasData) {
        //       var sourcesList = snapshot.data?.sources ?? [];
        //       if (sourcesList == null || sourcesList.isEmpty) {
        //         return Center(
        //           child: Text('no sources found',
        //             style: Theme
        //                 .of(context)
        //                 .textTheme
        //                 .headlineMedium,),
        //         );
        //       } else {
        //         //todo: server => response => success
        //         return SourcesTabWidget(sourcesList: sourcesList);
        //       }
        //       } else {
        //         return Center(
        //           child: Text('starting fetching source ',
        //             style: Theme
        //                 .of(context)
        //                 .textTheme
        //                 .headlineMedium,),
        //         );
        //       }
        //     },
        // ),
      ),
    );
  }
}
