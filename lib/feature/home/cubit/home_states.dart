import 'package:eqraa_book_store/feature/home/model/book_model.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeSuccessState extends HomeStates {
  final List<BookModel> books;
  final List<BookModel> newArrivals;
  HomeSuccessState(this.books, {this.newArrivals = const []});
}

class HomeLoadingMoreState extends HomeStates {
  final List<BookModel> books;
  final List<BookModel> newArrivals;
  HomeLoadingMoreState(this.books, this.newArrivals);
}

class HomeErrorState extends HomeStates {
  final String message;
  HomeErrorState(this.message);
}
