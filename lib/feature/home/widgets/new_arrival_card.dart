import 'package:eqraa_book_store/core/constants/text_style.dart';
import 'package:flutter/material.dart';

class NewArrivalCard extends StatelessWidget {
  const NewArrivalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white70,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 30,
            offset: Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(
                  "https://covers.openlibrary.org/b/id/14627227-L.jpg",
                ),
                fit: BoxFit.fill,
              ),
            ),
            height: 100,
            width: 100,
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "The Great Gatsby",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text("F. Scott Fitzgerald", style: StylesManager.textStyle15px),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
