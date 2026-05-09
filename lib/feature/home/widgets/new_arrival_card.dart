import 'package:eqraa_book_store/core/constants/text_style.dart';
import 'package:flutter/material.dart';

class NewArrivalCard extends StatelessWidget {
  const NewArrivalCard({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.7,
      padding: EdgeInsets.all(screenWidth * 0.025),
      decoration: BoxDecoration(
        color: Colors.white70,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: NetworkImage(
                  "https://covers.openlibrary.org/b/id/14627227-L.jpg",
                ),
                fit: BoxFit.fill,
              ),
            ),
            height: screenHeight * 0.12,
            width: screenHeight * 0.12,
          ),
          SizedBox(width: screenWidth * 0.04),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "The Great Gatsby",
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "F. Scott Fitzgerald",
                  style: StylesManager.textStyle15px.copyWith(
                    fontSize: screenWidth * 0.035,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
