import 'dart:math';
import 'package:hive/hive.dart';

part 'book_model.g.dart';

@HiveType(typeId: 0)
class BookModel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String author;
  @HiveField(2)
  final String imageUrl;
  @HiveField(3)
  final double price;
  @HiveField(4)
  final double rating;
  @HiveField(5)
  final String language;
  @HiveField(6)
  final int pages;
  @HiveField(7)
  bool isFavorite;

  BookModel({
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.language,
    required this.pages,
    this.isFavorite = false,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    // Generate a random price between 10 and 100
    final double randomPrice = (Random().nextDouble() * 90) + 10;
    
    return BookModel(
      title: json['title'] ?? 'Unknown Title',
      author: (json['author_name'] as List?)?.first ?? 'Unknown Author',
      imageUrl: json['cover_i'] != null
          ? 'https://covers.openlibrary.org/b/id/${json['cover_i']}-L.jpg'
          : 'https://via.placeholder.com/150',
      price: double.parse(randomPrice.toStringAsFixed(2)),
      rating: json['ratings_average']?.toDouble() ?? (Random().nextDouble() * 2 + 3),
      language: (json['language'] as List?)?.first ?? 'English',
      pages: json['number_of_pages_median'] ?? (Random().nextInt(300) + 100),
      isFavorite: false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'author': author,
      'imageUrl': imageUrl,
      'price': price,
      'rating': rating,
      'language': language,
      'pages': pages,
      'isFavorite': isFavorite,
    };
  }
}
