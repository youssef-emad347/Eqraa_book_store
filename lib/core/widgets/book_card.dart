import 'package:eqraa_book_store/core/constants/text_style.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final String title;
  final String author;
  final String imageUrl;
  final double price;
  final VoidCallback? onTap;

  const BookCard({
    super.key,
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.price,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        spacing: 6,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 0.9,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          Text(
            author,
            style: StylesManager.textStyle15px,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "\$${price.toStringAsFixed(2)}",
            style: const TextStyle(fontSize: 18),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
