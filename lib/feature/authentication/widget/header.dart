import 'package:eqraa_book_store/core/constants/text_style.dart';
import 'package:flutter/material.dart';

class HeaderCustomWidget extends StatelessWidget {
  final String text;

  const HeaderCustomWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          "assets/logoBlue.png",
          height: screenHeight * 0.12,
          width: screenWidth * 0.25,
          fit: BoxFit.fill,
        ),
        SizedBox(height: screenHeight * 0.02),
        Text(
          text,
          style: StylesManager.textStyle28px.copyWith(
            fontSize: screenWidth * 0.07,
          ),
        ),
        SizedBox(height: screenHeight * 0.01),
        Text(
          "Enter your information below",
          style: StylesManager.textStyle15px.copyWith(
            fontSize: screenWidth * 0.035,
          ),
        ),
      ],
    );
  }
}
