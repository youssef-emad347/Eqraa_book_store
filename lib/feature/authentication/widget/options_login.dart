import 'package:eqraa_book_store/core/constants/text_style.dart';
import 'package:flutter/material.dart';

class OptionLogin extends StatelessWidget {
  final String text;
  final String image;
  const OptionLogin({super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.42,
      height: screenHeight * 0.07,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            image,
            height: screenHeight * 0.03,
            width: screenWidth * 0.05,
            fit: BoxFit.contain,
          ),
          SizedBox(width: screenWidth * 0.02),
          Flexible(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: StylesManager.optionLogin20px,
            ),
          ),
        ],
      ),
    );
  }
}
