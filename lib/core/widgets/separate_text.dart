import 'package:eqraa_book_store/core/constants/text_style.dart';
import 'package:flutter/material.dart';

class SeparateText extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const SeparateText({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: StylesManager.textStyle24px),
          Spacer(),
          GestureDetector(
            onTap: onTap,
            child: Text("See All", style: StylesManager.textStyleBlue18px),
          ),
        ],
      ),
    );
  }
}
