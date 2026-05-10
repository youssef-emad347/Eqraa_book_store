import 'package:eqraa_book_store/core/widgets/book_card.dart';
import 'package:eqraa_book_store/core/widgets/search_text_field.dart';
import 'package:eqraa_book_store/core/widgets/separate_text.dart';
import 'package:eqraa_book_store/feature/details/book_details_screen.dart';
import 'package:eqraa_book_store/core/data_source/book_api_service.dart';
import 'package:eqraa_book_store/feature/home/model/book_model.dart';
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
                    const SearchTextField(autofocus: true),
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
                    SeparateText(text: "Popular Books", onTap: () {}),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: FutureBuilder<List<BookModel>>(
                  future: BookApiService().fetchBooks(query: 'popular'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text('No popular books found'),
                      );
                    }

                    final popularBooks = snapshot.data!;
                    return GridView.builder(
                      padding: const EdgeInsets.only(top: 10),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 15,
                            childAspectRatio: 0.55,
                          ),
                      itemCount: popularBooks.length,
                      itemBuilder: (context, index) {
                        final book = popularBooks[index];
                        return BookCard(
                          title: book.title,
                          author: book.author,
                          imageUrl: book.imageUrl,
                          price: book.price,
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
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
