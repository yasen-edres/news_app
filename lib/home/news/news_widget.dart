import 'package:flutter/material.dart';
import 'package:news/home/news/news_item.dart';
import 'package:news/home/news/news_view_model.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class NewsWidget extends StatefulWidget {
  final Source source;

  const NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsViewModel viewModel = NewsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id ?? '');
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<NewsViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.errorMessage != null) {
            //todo: error
            return Column(
              children: [
                Text(
                  viewModel.errorMessage!,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                ElevatedButton(
                  onPressed: () {
                    viewModel.getNewsBySourceId(widget.source.id ?? '');
                  },
                  child: Text(
                    'Try Again',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ],
            );
          } else if (viewModel.newsList == null) {
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
            //todo: success
            return ListView.separated(
              padding: EdgeInsets.only(top: height * 0.02),
              separatorBuilder: (context, index) =>
                  SizedBox(height: height * 0.02),
              itemBuilder: (context, index) {
                return NewsItem(news: viewModel.newsList![index]);
              },
              itemCount: viewModel.newsList!.length,
            );
          }
        },
      ),
    );
  }
}
