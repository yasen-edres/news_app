import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api/api_constant.dart';
import 'package:news/model/NewsResponse.dart';

import '../model/SourceResponse.dart';
import 'end_points.dart';
class ApiManager{
  /*
  https://newsapi.org/v2/top-headlines/sources?apiKey=16d6efa19a09420fba91d4850c0a993b
  */
  static Future<SourceResponse> getSources({required String categoryId}) async {
   Uri url = Uri.https(ApiConstants.baseUrl,
     EndPoints.sourceApi,{
         'apiKey': ApiConstants.apiKey,
         "category": categoryId
       }
   );
   try{
     var response = await http.get(url);
     String responseBody = response.body; ///String
     ///String => Json => Object
     var json = jsonDecode(responseBody);
     return SourceResponse.fromJson(json);
     // Source.fromJson(jsonDecode(response.body));
   }catch(e){
     rethrow;
   }

 }

  static Future<NewsResponse> getNewsBySourceId(String sourceId) async{
  Uri url = Uri.https(ApiConstants.baseUrl,
  EndPoints.newsApi,
  {
    'apiKey':ApiConstants.apiKey,
    'sources': sourceId,
  });
  try{
    var response = await http.get(url);
    var responseBody = response.body;
    var json = jsonDecode(responseBody);
    return NewsResponse.fromJson(json);
  }catch(e){
    rethrow;
  }



}
}