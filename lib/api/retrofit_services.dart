import 'package:dio/dio.dart';
import 'package:news/api/end_points.dart';
import 'package:news/api/model/news/news_response.dart';
import 'package:news/api/model/source_response.dart';
import 'package:retrofit/retrofit.dart';

part 'retrofit_services.g.dart';

@RestApi(baseUrl: 'https://newsapi.org')
abstract class RetrofitServices {
  factory RetrofitServices(Dio dio, {String? baseUrl}) = _RetrofitServices;

  @GET(EndPoints.sourceApi)
  Future<List<SourceResponse>> getSources(
    @Query('apiKey') String apiKey,
    @Query('category') String categoryId,
  );

  @GET(EndPoints.newsApi)
  Future<NewsResponse> getNewsBySourceId(
    @Query('apiKey') String apiKey,
    @Query('sources') String sourceId,
  );
}
