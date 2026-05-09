import 'package:eqraa_book_store/core/constants/constants.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Constants.mainColor, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade200, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        hint: Text(
          "Search",
          style: TextStyle(fontSize: 16, color: Colors.grey.shade400),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Image.asset("assets/searchIcon.png"),
        ),
        contentPadding: const EdgeInsets.symmetric(
          // horizontal: 30,
          vertical: 20,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: Image.asset("assets/filterIcon.png"),
        ),
      ),
    );
  }
}
