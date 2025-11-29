import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';

import '../../model/NewsResponse.dart';

class NewsViewModel extends ChangeNotifier {
  //todo: hold data - handel logic.
  List<News>? newsList;
  String? errorMessage;

  void getNewsBySourceId(String sourceId) async {
    //todo: reinitialize\
    newsList = null;
    errorMessage = null;
    notifyListeners();
    try {
      var NewsResponse = await ApiManager.getNewsBySourceId(sourceId);
      if (NewsResponse.message == "error") {
        //todo: error
        errorMessage = NewsResponse.message;
      } else {
        //todo: success
        newsList = NewsResponse.articles;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}
