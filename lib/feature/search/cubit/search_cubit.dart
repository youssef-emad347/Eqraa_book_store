import 'package:eqraa_book_store/core/data_source/book_api_service.dart';
import 'package:eqraa_book_store/feature/search/cubit/search_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitial());

  final BookApiService _apiService = BookApiService();

  void searchBooks(String query) async {
    if (query.isEmpty) {
      emit(SearchInitial());
      return;
    }

    if (query.length < 2) {
      // Don't search yet, but you could emit a state to show "type more..."
      // For now, let's just keep the current state or emit Initial.
      return;
    }

    emit(SearchLoading());
    try {
      final books = await _apiService.fetchBooks(query: query);
      emit(SearchSuccess(books));
    } catch (e) {
      emit(SearchError("Could not find books for '$query'. Please try a different search."));
    }
  }

  void clearSearch() {
    emit(SearchInitial());
  }
}
