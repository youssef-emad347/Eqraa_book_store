import 'package:eqraa_book_store/core/constants/text_style.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(height: 1, width: screenWidth * 0.34, color: Colors.grey),
        SizedBox(width: screenWidth * 0.02),
        Text("Or Login With", style: StylesManager.orDividerText),
        SizedBox(width: screenWidth * 0.02),
        Container(height: 1, width: screenWidth * 0.34, color: Colors.grey),
      ],
    );
  }
}
