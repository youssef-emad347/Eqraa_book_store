import 'package:eqraa_book_store/core/widgets/book_card.dart';
import 'package:eqraa_book_store/core/widgets/search_text_field.dart';
import 'package:eqraa_book_store/core/widgets/separate_text.dart';
import 'package:eqraa_book_store/feature/authentication/details/book_details_screen.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> recentSearches = [
      'The Morac Book 1',
      'Elvenwood Forest',
      'Stillwell Long Island',
    ];

    final List<Map<String, dynamic>> popularBooks = [
      {
        'title': 'Stillwell Long Island',
        'author': 'Adam Smith',
        'imageUrl': 'https://covers.openlibrary.org/b/id/14627227-L.jpg',
        'price': 120.0,
        'rating': 4.5,
        'language': 'English',
        'pages': 316,
      },
      {
        'title': 'Warmage Book 2',
        'author': 'Terry Mancour',
        'imageUrl': 'https://covers.openlibrary.org/b/id/8225261-L.jpg',
        'price': 60.0,
        'rating': 5.0,
        'language': 'English',
        'pages': 450,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SearchTextField(
                      autofocus: true,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Recent Search",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: recentSearches.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              const Icon(Icons.history, color: Colors.grey),
                              const SizedBox(width: 15),
                              Text(
                                recentSearches[index],
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                              const Spacer(),
                              const Icon(Icons.close, color: Colors.grey),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    const SeparateText(text: "Popular Books"),
                  ],
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(top: 10),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 0.65,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final book = popularBooks[index];
                      return BookCard(
                        title: book['title'] as String,
                        author: book['author'] as String,
                        imageUrl: book['imageUrl'] as String,
                        price: book['price'] as double,
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
                    childCount: popularBooks.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
