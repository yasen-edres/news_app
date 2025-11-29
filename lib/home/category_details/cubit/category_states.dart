import 'package:news/model/SourceResponse.dart';

abstract class CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategoryErrorState extends CategoryState {
  String? errorMessage;

  CategoryErrorState({required this.errorMessage});
}

class CategorySuccessState extends CategoryState {
  List<Source>? sourcesList;

  CategorySuccessState({required this.sourcesList});
}
