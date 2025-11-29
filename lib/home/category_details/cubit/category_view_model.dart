import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/home/category_details/cubit/category_states.dart';

class CategoryViewModel extends Cubit<CategoryState> {
  CategoryViewModel() : super(CategoryLoadingState());

  //todo: hold data - handel logic.
  // List<Source>? sourcesList;
  // String? errorMessage;
  void getSources(String categoryId) async {
    try {
      emit(CategoryLoadingState());
      var sourceResponse = await ApiManager.getSources(categoryId: categoryId);
      if (sourceResponse.status == "error") {
        //todo: error.
        emit(CategoryErrorState(errorMessage: sourceResponse.message));
        return;
      }
      if (sourceResponse.status == "ok") {
        //todo: success.
        emit(CategorySuccessState(sourcesList: sourceResponse.sources));
        return;
      }
    } catch (e) {
      emit(CategoryErrorState(errorMessage: e.toString()));
    }
  }
}
