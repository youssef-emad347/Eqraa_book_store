import 'package:eqraa_book_store/feature/authentication/widget/header.dart';
import 'package:eqraa_book_store/feature/authentication/widget/options_login.dart';
import 'package:eqraa_book_store/feature/authentication/widget/or_divider.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderCustomWidget(text: "Let’s get you Login!"),
              SizedBox(height: screenHeight * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OptionLogin(text: "Google", image: "assets/google.png"),
                  OptionLogin(text: "Apple", image: "assets/apple.png"),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              OrDivider(),
            ],
          ),
        ),
      ),
    );
  }
}
