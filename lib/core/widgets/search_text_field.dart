import 'package:eqraa_book_store/core/constants/constants.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final VoidCallback? onTap;
  final bool readOnly;
  final bool autofocus;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  const SearchTextField({
    super.key,
    this.onTap,
    this.readOnly = false,
    this.autofocus = false,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      readOnly: readOnly,
      autofocus: autofocus,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Constants.mainColor, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade200, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: "Search",
        hintStyle: TextStyle(fontSize: 16, color: Colors.grey.shade400),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            "assets/searchIcon.png",
            height: 20,
            width: 20,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            "assets/filterIcon.png",
            height: 20,
            width: 20,
          ),
        ),
      ),
    );
  }
}
