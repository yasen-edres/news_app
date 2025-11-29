import 'package:bloc/bloc.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/home/news/cubit/news_states.dart';

class NewsViewModel extends Cubit<NewsState> {
  NewsViewModel() : super(NewsLoadingState());

  void getNewsBySourceId(String sourceId) async {
    try {
      var newsResponse = await ApiManager.getNewsBySourceId(sourceId);
      if (newsResponse.status == 'error') {
        //todo: error
        emit(NewsErrorState(errorMessage: newsResponse.message));
        return;
      } else {
        //todo: success
        emit(NewsSuccessState(newsList: newsResponse.articles));
        return;
      }
    } catch (e) {
      emit(NewsErrorState(errorMessage: e.toString()));
    }
  }
}
