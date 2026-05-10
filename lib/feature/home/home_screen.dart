import 'package:eqraa_book_store/core/constants/text_style.dart';
import 'package:eqraa_book_store/core/widgets/book_card.dart';
import 'package:eqraa_book_store/core/widgets/search_text_field.dart';
import 'package:eqraa_book_store/core/widgets/separate_text.dart';
import 'package:eqraa_book_store/feature/categories/categories_screen.dart';
import 'package:eqraa_book_store/feature/home/cubit/home_cubit.dart';
import 'package:eqraa_book_store/feature/home/cubit/home_states.dart';
import 'package:eqraa_book_store/feature/home/model/book_model.dart';
import 'package:eqraa_book_store/feature/home/widgets/new_arrival_card.dart';
import 'package:eqraa_book_store/feature/home/widgets/categories_choice.dart';
import 'package:eqraa_book_store/feature/home/widgets/category_books_screen.dart';
import 'package:eqraa_book_store/feature/details/book_details_screen.dart';
import 'package:eqraa_book_store/feature/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => HomeCubit()..getInitialData(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    screenWidth * 0.05,
                    screenHeight * 0.02,
                    screenWidth * 0.05,
                    0,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                        child: Row(
                          children: [
                            SizedBox(
                              height: screenHeight * 0.035,
                              width: screenHeight * 0.035,
                              child: Image.asset(
                                'assets/menuIcon.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.04),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hello, Willie 👋🏻',
                                  style: StylesManager.textStyle15px.copyWith(
                                    fontSize: screenWidth * 0.035,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  'Keep exploring',
                                  style: StylesManager.textStyle24px.copyWith(
                                    fontSize: screenWidth * 0.06,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            const Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              height: screenHeight * 0.06,
                              width: screenHeight * 0.06,
                              child: Image.asset(
                                'assets/cartIcon.png',
                                scale: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SearchTextField(
                        readOnly: true,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SearchScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Column(
                    children: [
                      SeparateText(
                        text: 'New Arrivals',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CategoryBooksScreen(
                                categoryName: 'New Arrivals',
                                query: 'new',
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: screenHeight * 0.015),
                      BlocBuilder<HomeCubit, HomeStates>(
                        buildWhen: (previous, current) {
                          if (current is HomeSuccessState ||
                              current is HomeLoadingState)
                            return true;
                          return false;
                        },
                        builder: (context, state) {
                          if (state is HomeLoadingState) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          List<BookModel> newArrivals = [];
                          if (state is HomeSuccessState) {
                            newArrivals = state.newArrivals;
                          } else if (state is HomeLoadingMoreState) {
                            newArrivals = state.newArrivals;
                          }

                          if (newArrivals.isEmpty) return const SizedBox();

                          return SizedBox(
                            height: screenHeight * 0.15,
                            child: ListView.builder(
                              clipBehavior: Clip.none,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final book = newArrivals[index];
                                return Padding(
                                  padding: EdgeInsets.only(
                                    right: screenWidth * 0.03,
                                  ),
                                  child: NewArrivalCard(
                                    book: book,
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              BookDetailsScreen(
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
                                  ),
                                );
                              },
                              itemCount: newArrivals.length > 5
                                  ? 5
                                  : newArrivals.length,
                            ),
                          );
                        },
                      ),
                      SizedBox(height: screenHeight * 0.015),
                    ],
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Column(
                    children: [
                      SeparateText(
                        text: 'All Categories',
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CategoriesScreen(),
                          ),
                        ),
                      ),
                      const CategoryChips(),
                      SizedBox(height: screenHeight * 0.015),
                    ],
                  ),
                ),
              ),
              // 4. Main Books Grid with its own BlocBuilder
              BlocBuilder<HomeCubit, HomeStates>(
                buildWhen: (previous, current) {
                  // Only rebuild if it's initial load, success state (books list might change), or loading more
                  if (current is HomeLoadingState ||
                      current is HomeSuccessState ||
                      current is HomeLoadingMoreState) {
                    return true;
                  }
                  return false;
                },
                builder: (context, state) {
                  if (state is HomeLoadingState) {
                    return const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    );
                  } else if (state is HomeErrorState) {
                    return SliverToBoxAdapter(
                      child: Center(child: Text(state.message)),
                    );
                  }

                  List<BookModel> books = [];
                  if (state is HomeSuccessState) {
                    books = state.books;
                  } else if (state is HomeLoadingMoreState) {
                    books = state.books;
                  }

                  return SliverPadding(
                    padding: EdgeInsets.fromLTRB(
                      screenWidth * 0.05,
                      screenHeight * 0.01,
                      screenWidth * 0.05,
                      screenHeight * 0.02,
                    ),
                    sliver: SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 15,
                            childAspectRatio: 0.6,
                          ),
                      delegate: SliverChildBuilderDelegate((context, index) {
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
                      }, childCount: books.length),
                    ),
                  );
                },
              ),

              // 5. Fetch More Books button
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: BlocBuilder<HomeCubit, HomeStates>(
                    builder: (context, state) {
                      if (state is HomeLoadingMoreState) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return ElevatedButton(
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
                      );
                    },
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
