import 'package:eqraa_book_store/feature/home/model/book_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static const String _favoritesBoxName = 'favorites';

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(BookModelAdapter());
    await Hive.openBox<BookModel>(_favoritesBoxName);
  }

  static Box<BookModel> get favoritesBox => Hive.box<BookModel>(_favoritesBoxName);

  static Future<void> addFavorite(BookModel book) async {
    await favoritesBox.put(book.title, book);
  }

  static Future<void> removeFavorite(String title) async {
    await favoritesBox.delete(title);
  }

  static bool isFavorite(String title) {
    return favoritesBox.containsKey(title);
  }

  static List<BookModel> getFavorites() {
    return favoritesBox.values.toList();
  }
}
