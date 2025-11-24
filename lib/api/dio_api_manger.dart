import 'package:dio/dio.dart';
import 'package:news/api/dio_interceptor.dart';
import 'package:news/api/end_points.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:pretty_dio_logger/src/pretty_dio_logger.dart';

class DioApiManager {
  static Dio dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org',
        // queryParameters: {
        //   'apiKey': ApiConstants.apiKey,
        // }
      )
  );

  DioApiManager() {
    dio.interceptors.add(DioInterceptor());
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ) //why not work
    );
  }

  /*
  https://newsapi.org/v2/top-headlines/sources?apiKey=16d6efa19a09420fba91d4850c0a993b
  */
  Future<SourceResponse> getSources({required String categoryId}) async {
    try {
      var response = await dio.get(
        EndPoints.sourceApi,
        queryParameters: {
          "category": categoryId,
        },
      );
      var json = response.data;
      var sourceResponse = SourceResponse.fromJson(json);
      return sourceResponse;
    } catch (e) {
      rethrow;
    }
  }

  Future<NewsResponse> getNewsBySourceId(String sourceId) async {
    try {
      var response = await dio.get(
        EndPoints.newsApi,
        queryParameters: {
          'sources': sourceId
        },
      );
      var json = response.data;
      var sourceResponse = NewsResponse.fromJson(json);
      return sourceResponse;
    } catch (e) {
      rethrow;
    }
  }
}
