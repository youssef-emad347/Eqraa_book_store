import 'package:eqraa_book_store/core/constants/text_style.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        const Expanded(child: Divider(color: Colors.grey)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
          child: Text(
            "Or Login With",
            style: StylesManager.orDividerText.copyWith(
              fontSize: screenWidth * 0.035,
            ),
          ),
        ),
        const Expanded(child: Divider(color: Colors.grey)),
      ],
    );
  }
}
