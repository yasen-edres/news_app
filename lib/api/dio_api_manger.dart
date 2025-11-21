import 'package:dio/dio.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourceResponse.dart';

import 'api_constant.dart';

class DioApiManager {
  static Dio dio = Dio();

  /*
  https://newsapi.org/v2/top-headlines/sources?apiKey=16d6efa19a09420fba91d4850c0a993b
  */
  static Future<SourceResponse> getSources({required String categoryId}) async {
    try {
      var response = await dio.get(
        'https://newsapi.org/v2/top-headlines/sources',
        queryParameters: {
          'apiKey': ApiConstants.apiKey,
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

  static Future<NewsResponse> getNewsBySourceId(String sourceId) async {
    try {
      var response = await dio.get(
        'https://newsapi.org/v2/everything',
        queryParameters: {'apiKey': ApiConstants.apiKey, 'sources': sourceId},
      );
      var json = response.data;
      var sourceResponse = NewsResponse.fromJson(json);
      return sourceResponse;
    } catch (e) {
      rethrow;
    }
  }
}
