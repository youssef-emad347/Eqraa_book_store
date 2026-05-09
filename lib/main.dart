import 'package:eqraa_book_store/feature/authentication/forget_password/forget_password.dart';
import 'package:eqraa_book_store/core/constants/constants.dart';
import 'package:eqraa_book_store/feature/authentication/login/login_screen.dart';
import 'package:eqraa_book_store/feature/authentication/signup/signup_screen.dart';
import 'package:eqraa_book_store/feature/home/home_screen.dart';
import 'package:eqraa_book_store/feature/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 1.5),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Constants.mainColor,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      routes: {
        "/onboarding": (context) => OnboardingScreen(),
        "/login": (context) => LoginScreen(),
        "/signup": (context) => SignUpScreen(),
        "/forgetpassword": (context) => ForgetPassword(),
      },
    );
  }
}
