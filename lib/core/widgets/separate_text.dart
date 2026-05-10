import 'package:eqraa_book_store/core/constants/text_style.dart';
import 'package:flutter/material.dart';

class SeparateTextCustomWidget extends StatelessWidget {
  final String text1;
  final String text2;

  const SeparateTextCustomWidget({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1,
            style: StylesManager.textStyle24px.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            text2,
            style: StylesManager.textStyleBlue18px.copyWith(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
