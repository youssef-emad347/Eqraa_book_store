import 'package:eqraa_book_store/core/constants/text_style.dart';
import 'package:eqraa_book_store/core/widgets/main_button.dart';
import 'package:eqraa_book_store/feature/authentication/forget_password/widget/otp_custom_widget.dart';
import 'package:eqraa_book_store/feature/authentication/forget_password/widget/otp_timer.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(4, (_) => TextEditingController());
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 70,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Enter OTP Code", style: StylesManager.textStyle28px),
              SizedBox(height: screenHeight * 0.02),
              Text(
                "OTP code has been sent to (209) 555-0104",
                style: StylesManager.textStyle15px,
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  4,
                  (index) => OtpCustomWidget(
                    controller: _controllers[index],
                    onChanged: (value) {
                      if (value.isNotEmpty && index < 3) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              OtpTimer(
                seconds: 60,
                onResend: () {
                  // هنا تبعت الـ request تاني
                },
              ),
              SizedBox(height: screenHeight * 0.068),
              Center(
                child: Image.asset(
                  "assets/pana.png",
                  height: screenHeight * 0.4,
                  width: screenWidth * 0.9,
                ),
              ),
              SizedBox(height: screenHeight * 0.05),

              Center(
                child: MainButton(
                  title: "Submit",
                  isEnabled: true,
                  onPressedFunction: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
