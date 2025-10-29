import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/utils/app_rotes.dart';
import 'package:news/utils/app_styles.dart';
import 'package:shimmer/shimmer.dart';

class NewsItem extends StatefulWidget {
  News news;

  NewsItem({super.key, required this.news});

  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(AppRoute.webviewRouteName, arguments: {
          'news': widget.news
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.02,
          vertical: height * 0.02,
        ),
        margin: EdgeInsets.symmetric(horizontal: width * 0.04),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Theme
              .of(context)
              .splashColor, width: 2),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl: widget.news.urlToImage!,
                placeholder: (context, url) =>
                    Container(
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
                          ],
                        ),
                      ),
                    ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(height: height * 0.02),
            Text(widget.news.title ?? '', style: Theme
                .of(context)
                .textTheme
                .labelLarge),
            SizedBox(height: height * 0.02),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'By: ${widget.news.author ?? ''}',
                    style: AppStyle.medium12Gray,
                  ),
                ),
                Text(widget.news.publishedAt ?? '',
                    style: AppStyle.medium12Gray),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
