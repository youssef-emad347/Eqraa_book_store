import 'package:eqraa_book_store/core/widgets/main_button.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          // fit: StackFit.expand,
          children: [
            Center(
              child: SizedBox(
                height: size.height * .9,
                child: Image.asset(
                  "assets/onBoardingPhoto.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(20),
                color: Colors.white,
                width: double.infinity,
                height: size.height * 0.35,
                child: Column(
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      "Your personal library in your pocket",
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: size.height * .01),
                    Text(
                      textAlign: TextAlign.center,
                      "It is a long established fact that a reader will be distracted by the readable content.",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    MainButton(
                      title: "Next",
                      isEnabled: true,
                      onPressedFunction: () {
                        Navigator.pushReplacementNamed(context, "/login");
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
