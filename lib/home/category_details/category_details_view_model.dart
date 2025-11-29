import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/SourceResponse.dart';

class CategoryDetailsViewModel extends ChangeNotifier {
  //todo: hold data - handel logic.
  List<Source>? sourcesList;
  String? errorMessage;

  void getSources(String categoryId) async {
    //todo: reinitialize;
    sourcesList = null;
    errorMessage = null;
    notifyListeners();
    try {
      var sourceResponse = await ApiManager.getSources(categoryId: categoryId);
      if (sourceResponse.status == 'error') {
        //todo: error
        errorMessage = sourceResponse.message;
      } else {
        //todo: success
        sourcesList = sourceResponse.sources;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}
