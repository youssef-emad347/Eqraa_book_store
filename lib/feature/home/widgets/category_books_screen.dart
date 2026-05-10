import 'package:eqraa_book_store/core/widgets/book_card.dart';
import 'package:eqraa_book_store/feature/home/cubit/home_cubit.dart';
import 'package:eqraa_book_store/feature/home/cubit/home_states.dart';
import 'package:eqraa_book_store/feature/details/book_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eqraa_book_store/core/constants/text_style.dart';

class CategoryBooksScreen extends StatelessWidget {
  final String categoryName;
  final String? query;

  const CategoryBooksScreen({
    super.key,
    required this.categoryName,
    this.query,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getBooks(query: query ?? categoryName.toLowerCase()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            categoryName,
            style: StylesManager.textStyle24px.copyWith(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<HomeCubit, HomeStates>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeErrorState) {
              return Center(child: Text(state.message));
            } else if (state is HomeSuccessState || state is HomeLoadingMoreState) {
              final books = state is HomeSuccessState ? state.books : (state as HomeLoadingMoreState).books;
              
              if (books.isEmpty) {
                return const Center(child: Text('No books found'));
              }

              return Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        childAspectRatio: 0.6,
                      ),
                      itemCount: books.length,
                      itemBuilder: (context, index) {
                        final book = books[index];
                        return BookCard(
                          title: book.title,
                          author: book.author,
                          imageUrl: book.imageUrl,
                          price: book.price,
                          isFavorite: book.isFavorite,
                          onFavoriteToggle: () {
                            context.read<HomeCubit>().toggleFavorite(index);
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
                  ),
                  if (state is HomeLoadingMoreState)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: CircularProgressIndicator(),
                    )
                  else
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          context.read<HomeCubit>().loadMoreBooks();
                        },
                        child: const Text(
                          'Fetch More Books',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
