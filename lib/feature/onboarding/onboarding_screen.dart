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
                padding: EdgeInsets.all(size.width * 0.05),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Your personal library in your pocket",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: size.width * 0.09,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Text(
                      "It is a long established fact that a reader will be distracted by the readable content.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: size.width * 0.035,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
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
