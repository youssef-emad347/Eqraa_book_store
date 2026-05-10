import 'package:eqraa_book_store/core/constants/text_style.dart';
import 'package:eqraa_book_store/core/widgets/book_card.dart';
import 'package:eqraa_book_store/feature/details/book_details_screen.dart';
import 'package:eqraa_book_store/feature/home/model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Favourites',
          style: StylesManager.textStyle24px.copyWith(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<BookModel>('favorites').listenable(),
        builder: (context, Box<BookModel> box, _) {
          final favoriteBooks = box.values.toList();

          if (favoriteBooks.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, size: 80, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'No favorites yet',
                    style: TextStyle(fontSize: 24, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return Padding(
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
                  title: book.title,
                  author: book.author,
                  imageUrl: book.imageUrl,
                  price: book.price,
                  isFavorite: true,
                  onFavoriteToggle: () {
                    box.delete(book.title);
                  },
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookDetailsScreen(
                          title: book.title,
                          author: book.author,
                          imageUrl: book.imageUrl,
                          price: book.price,
                          rating: book.rating,
                          language: book.language,
                          pages: book.pages,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
