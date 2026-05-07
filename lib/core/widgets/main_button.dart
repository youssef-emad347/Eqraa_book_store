import 'package:eqraa_book_store/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainButton extends StatelessWidget {
  final String title;
  final bool isEnabled;
  final Function() onPressedFunction;
  const MainButton({
    super.key,
    required this.title,
    required this.isEnabled,
    required this.onPressedFunction,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: Colors.grey[400],
        backgroundColor: Constants.mainColor,
        fixedSize: Size(size.width * .9, size.height * .07),
      ),
      onPressed: isEnabled ? onPressedFunction : null,
      child: Text(
        title,
        style: GoogleFonts.lexend(
          color: isEnabled ? Colors.white : Colors.grey[500],
          fontSize: 20,
          fontWeight: FontWeight.w200,
        ),
      ),
    );
  }
}
