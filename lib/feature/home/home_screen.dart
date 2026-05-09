import 'package:eqraa_book_store/core/constants/text_style.dart';
import 'package:eqraa_book_store/core/widgets/book_card.dart';
import 'package:eqraa_book_store/core/widgets/search_text_field.dart';
import 'package:eqraa_book_store/core/widgets/separate_text.dart';
import 'package:eqraa_book_store/feature/home/widgets/new_arrival_card.dart';
import 'package:eqraa_book_store/feature/home/widgets/categories_choice.dart';
import 'package:eqraa_book_store/feature/details/book_details_screen.dart';
import 'package:eqraa_book_store/feature/search/search_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> books = [
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
    {
      'title': 'Pride and Prejudice',
      'author': 'Jane Austen',
      'imageUrl': 'https://covers.openlibrary.org/b/id/8118144-L.jpg',
      'price': 35.0,
      'rating': 4.6,
      'language': 'English',
      'pages': 279,
    },
    {
      'title': 'The Catcher in the Rye',
      'author': 'J.D. Salinger',
      'imageUrl': 'https://covers.openlibrary.org/b/id/8231991-L.jpg',
      'price': 50.0,
      'rating': 4.2,
      'language': 'English',
      'pages': 214,
    },
    {
      'title': 'Harry Potter and the Sorcerer\'s Stone',
      'author': 'J.K. Rowling',
      'imageUrl': 'https://covers.openlibrary.org/b/id/7989100-L.jpg',
      'price': 60.0,
      'rating': 4.9,
      'language': 'English',
      'pages': 309,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
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
                              "assets/menuIcon.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.04),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hello, Willie 👋🏻",
                                  style: StylesManager.textStyle15px.copyWith(
                                    fontSize: screenWidth * 0.035,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "Keep exploring",
                                  style: StylesManager.textStyle24px.copyWith(
                                    fontSize: screenWidth * 0.06,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
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
                              "assets/cartIcon.png",
                              scale: 2,
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
                    SeparateText(text: "New Arrivals"),
                    SizedBox(height: screenHeight * 0.015),
                    SizedBox(
                      height: screenHeight * 0.18,
                      child: ListView.builder(
                        clipBehavior: Clip.none,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.only(right: screenWidth * 0.03),
                          child: const NewArrivalCard(),
                        ),
                        itemCount: 5,
                      ),
                    ),
                    SeparateText(text: "All Categories"),
                    const CategoryChips(),
                    SizedBox(height: screenHeight * 0.015),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(
                screenWidth * 0.05,
                screenHeight * 0.01,
                screenWidth * 0.05,
                screenHeight * 0.02,
              ),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 0.62,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  final book = books[index];
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
                }, childCount: books.length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
