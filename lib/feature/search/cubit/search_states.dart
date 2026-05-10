import 'package:eqraa_book_store/feature/home/model/book_model.dart';

abstract class SearchStates {}

class SearchInitial extends SearchStates {}

class SearchLoading extends SearchStates {}

class SearchSuccess extends SearchStates {
  final List<BookModel> books;
  SearchSuccess(this.books);
}

class SearchError extends SearchStates {
  final String message;
  SearchError(this.message);
}
