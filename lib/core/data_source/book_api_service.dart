import 'package:dio/dio.dart';
import 'package:eqraa_book_store/feature/home/model/book_model.dart';
import 'dart:math';

class BookApiService {
  final Dio _dio = Dio();

  Future<List<BookModel>> fetchBooks({String? query, int page = 1}) async {
    try {
      final List<String> randomQueries = [
        'fiction',
        'history',
        'science',
        'art',
        'mystery',
        'biography',
        'programming',
      ];
      final String searchQuery =
          query ?? randomQueries[Random().nextInt(randomQueries.length)];
      final response = await _dio.get(
        'https://openlibrary.org/search.json',
        queryParameters: {
          'q': searchQuery,
          'limit': 20,
          'page': page,
        },
      );

      if (response.statusCode == 200) {
        final List docs = response.data['docs'];
        return docs.map((doc) => BookModel.fromJson(doc)).toList();
      } else {
        throw Exception('Failed to load books from Open Library');
      }
    } catch (e) {
      throw Exception('Failed to connect to Open Library: $e');
    }
  }
}
