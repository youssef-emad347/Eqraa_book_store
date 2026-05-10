import 'package:eqraa_book_store/core/constants/text_style.dart';
import 'package:eqraa_book_store/core/widgets/book_card.dart';
import 'package:eqraa_book_store/feature/details/book_details_screen.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  final List<Map<String, dynamic>> favoriteBooks = [
    {
      'title': 'The Great Gatsby',
      'author': 'F. Scott Fitzgerald',
      'imageUrl': 'https://covers.openlibrary.org/b/id/14627227-L.jpg',
      'price': 55.0,
      'rating': 4.5,
      'language': 'English',
      'pages': 180,
    },
    {
      'title': 'To Kill a Mockingbird',
      'author': 'Harper Lee',
      'imageUrl': 'https://covers.openlibrary.org/b/id/8225261-L.jpg',
      'price': 45.0,
      'rating': 4.8,
      'language': 'English',
      'pages': 281,
    },
    {
      'title': '1984',
      'author': 'George Orwell',
      'imageUrl': 'https://covers.openlibrary.org/b/id/7222246-L.jpg',
      'price': 40.0,
      'rating': 4.7,
      'language': 'English',
      'pages': 328,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Favourites",
          style: StylesManager.textStyle24px.copyWith(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: favoriteBooks.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, size: 80, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    "No favorites yet",
                    style: TextStyle(fontSize: 24, color: Colors.grey),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 0.6,
                ),
                itemCount: favoriteBooks.length,
                itemBuilder: (context, index) {
                  final book = favoriteBooks[index];
                  return BookCard(
                    title: book['title'] as String,
                    author: book['author'] as String,
                    imageUrl: book['imageUrl'] as String,
                    price: book['price'] as double,
                    isFavorite: true,
                    onFavoriteToggle: () {
                      setState(() {
                        favoriteBooks.removeAt(index);
                      });
                    },
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookDetailsScreen(
                            title: book['title'] as String,
                            author: book['author'] as String,
                            imageUrl: book['imageUrl'] as String,
                            price: book['price'] as double,
                            rating: book['rating'] as double,
                            language: book['language'] as String,
                            pages: book['pages'] as int,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
    );
  }
}
