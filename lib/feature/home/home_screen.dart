import 'package:eqraa_book_store/core/constants/text_style.dart';
import 'package:eqraa_book_store/core/widgets/book_card.dart';
import 'package:eqraa_book_store/core/widgets/search_text_field.dart';
import 'package:eqraa_book_store/core/widgets/separate_text.dart';
import 'package:eqraa_book_store/feature/home/widgets/new_arrival_card.dart';
import 'package:eqraa_book_store/feature/home/widgets/categories_choice.dart';
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
    },
    {
      'title': 'To Kill a Mockingbird',
      'author': 'Harper Lee',
      'imageUrl': 'https://covers.openlibrary.org/b/id/8225261-L.jpg',
      'price': 45.0,
    },
    {
      'title': '1984',
      'author': 'George Orwell',
      'imageUrl': 'https://covers.openlibrary.org/b/id/7222246-L.jpg',
      'price': 40.0,
    },
    {
      'title': 'Pride and Prejudice',
      'author': 'Jane Austen',
      'imageUrl': 'https://covers.openlibrary.org/b/id/8118144-L.jpg',
      'price': 35.0,
    },
    {
      'title': 'The Catcher in the Rye',
      'author': 'J.D. Salinger',
      'imageUrl': 'https://covers.openlibrary.org/b/id/8231991-L.jpg',
      'price': 50.0,
    },
    {
      'title': 'Harry Potter and the Sorcerer\'s Stone',
      'author': 'J.K. Rowling',
      'imageUrl': 'https://covers.openlibrary.org/b/id/7989100-L.jpg',
      'price': 60.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 30,
                            width: 30,
                            child: Image.asset(
                              "assets/menuIcon.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hello, Willie 👋🏻",
                                style: StylesManager.textStyle15px,
                              ),
                              Text(
                                "Keep exploring",
                                style: StylesManager.textStyle24px,
                              ),
                            ],
                          ),
                          Spacer(),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            height: 50,
                            width: 50,
                            child: Image.asset(
                              "assets/cartIcon.png",
                              cacheHeight: 30,
                              cacheWidth: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SearchTextField(),
                    SeparateText(text: "New Arrivals"),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                        clipBehavior: Clip.none,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => const Padding(
                          padding: EdgeInsets.only(right: 12),
                          child: NewArrivalCard(),
                        ),
                        itemCount: 5,
                      ),
                    ),
                    SeparateText(text: "All Categories"),
                    CategoryChips(),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 0.65,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  final book = books[index];
                  return BookCard(
                    title: book['title'] as String,
                    author: book['author'] as String,
                    imageUrl: book['imageUrl'] as String,
                    price: book['price'] as double,
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
