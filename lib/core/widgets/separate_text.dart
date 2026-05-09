import 'package:eqraa_book_store/core/constants/text_style.dart';
import 'package:flutter/material.dart';

class SeparateText extends StatelessWidget {
  final String text;
  const SeparateText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
      child: Row(
        children: [
          Text(text, style: StylesManager.textStyle24px),
          Spacer(),
          Text("See All", style: StylesManager.textStyleBlue18px),
        ],
      ),
    );
  }
}
