import 'package:eqraa_book_store/core/data_source/book_api_service.dart';
import 'package:eqraa_book_store/feature/home/cubit/home_states.dart';
import 'package:eqraa_book_store/feature/home/model/book_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class HomeCubit extends Cubit<HomeStates> {
  final BookApiService _apiService = BookApiService();
  final Box<BookModel> _favoritesBox = Hive.box<BookModel>('favorites');

  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  List<BookModel> books = [];
  List<BookModel> newArrivals = [];
  int currentPage = 1;
  String? currentQuery;

  Future<void> getInitialData() async {
    emit(HomeLoadingState());
    try {
      // Fetch new arrivals (query 'new') and popular books (random default) in parallel
      final results = await Future.wait([
        _apiService.fetchBooks(query: 'new'),
        _apiService.fetchBooks(),
      ]);

      newArrivals = results[0];
      books = results[1];

      _syncFavorites(newArrivals);
      _syncFavorites(books);

      emit(HomeSuccessState(List.from(books), newArrivals: List.from(newArrivals)));
    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }
  }

  Future<void> getBooks({String? query}) async {
    emit(HomeLoadingState());
    currentQuery = query;
    currentPage = 1;
    try {
      books = await _apiService.fetchBooks(query: query, page: currentPage);
      _syncFavorites(books);
      emit(HomeSuccessState(List.from(books), newArrivals: List.from(newArrivals)));
    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }
  }

  Future<void> loadMoreBooks() async {
    if (state is HomeLoadingMoreState) return;

    emit(HomeLoadingMoreState(List.from(books), List.from(newArrivals)));
    currentPage++;
    try {
      final moreBooks = await _apiService.fetchBooks(
        query: currentQuery,
        page: currentPage,
      );
      _syncFavorites(moreBooks);
      books.addAll(moreBooks);
      emit(HomeSuccessState(List.from(books), newArrivals: List.from(newArrivals)));
    } catch (e) {
      emit(HomeSuccessState(List.from(books), newArrivals: List.from(newArrivals)));
    }
  }

  void _syncFavorites(List<BookModel> bookList) {
    for (var book in bookList) {
      if (_favoritesBox.containsKey(book.title)) {
        book.isFavorite = true;
      }
    }
  }

  void toggleFavorite(int index, {bool isNewArrival = false}) {
    final book = isNewArrival ? newArrivals[index] : books[index];
    book.isFavorite = !book.isFavorite;

    if (book.isFavorite) {
      _favoritesBox.put(book.title, book);
    } else {
      _favoritesBox.delete(book.title);
    }

    emit(
      HomeSuccessState(List.from(books), newArrivals: List.from(newArrivals)),
    );
  }
}
