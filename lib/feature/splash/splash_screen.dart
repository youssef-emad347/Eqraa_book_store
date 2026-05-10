import 'package:eqraa_book_store/core/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        if (FirebaseAuth.instance.currentUser != null) {
          Navigator.pushReplacementNamed(context, "/mainlayout");
        } else {
          Navigator.pushReplacementNamed(context, "/onboarding");
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Constants.mainColor,
        child: Center(
          child: SizedBox(
            // width: size.width * 0.3,
            height: size.height * 0.2,
            child: Image.asset("assets/logoWhite.png", fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}
