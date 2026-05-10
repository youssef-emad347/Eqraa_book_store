import 'package:eqraa_book_store/core/constants/text_style.dart';
import 'package:eqraa_book_store/feature/home/widgets/category_books_screen.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  static const List<Map<String, dynamic>> categories = [
    {'name': 'Art', 'color': Color(0xFFFDE8E8)},
    {'name': 'Business', 'color': Color(0xFFE1EFFE)},
    {'name': 'Comedy', 'color': Color(0xFFEBF5FF)},
    {'name': 'Drama', 'color': Color(0xFFFDF2F2)},
    {'name': 'Fiction', 'color': Color(0xFFF3F4F6)},
    {'name': 'History', 'color': Color(0xFFE5E7EB)},
    {'name': 'Horror', 'color': Color(0xFFFDE8E8)},
    {'name': 'Science', 'color': Color(0xFFE1EFFE)},
    {'name': 'Technology', 'color': Color(0xFFF0FDF4)},
    {'name': 'Travel', 'color': Color(0xFFFFF7ED)},
    {'name': 'Medical', 'color': Color(0xFFF5F3FF)},
    {'name': 'Design', 'color': Color(0xFFFFF1F2)},
  ];

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
          "Categories",
          style: StylesManager.textStyle24px.copyWith(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.5,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryBooksScreen(
                      categoryName: categories[index]['name'],
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: categories[index]['color'],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    categories[index]['name'],
                    style: StylesManager.optionLogin20px,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
