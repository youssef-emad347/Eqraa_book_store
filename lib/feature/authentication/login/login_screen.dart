import 'package:eqraa_book_store/core/widgets/main_button.dart';
import 'package:eqraa_book_store/feature/authentication/widget/custom_text_form_feild.dart';
import 'package:eqraa_book_store/feature/authentication/widget/header.dart';
import 'package:eqraa_book_store/feature/authentication/widget/options_login.dart';
import 'package:eqraa_book_store/feature/authentication/widget/or_divider.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeaderCustomWidget(text: "Let's get you Login!"),
                        SizedBox(height: screenHeight * 0.03),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            OptionLogin(
                              text: "Google",
                              image: "assets/google.png",
                            ),
                            OptionLogin(
                              text: "Apple",
                              image: "assets/apple.png",
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        OrDivider(),
                        SizedBox(height: screenHeight * 0.025),
                        CustomTextFormField(
                          hint: "Email",
                          prefixIcon: Icons.email_outlined,
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(
                              r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
                            ).hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: screenHeight * 0.0025),
                        CustomTextFormField(
                          hint: "Password",
                          prefixIcon: Icons.lock_outlined,
                          obscure: !_isPasswordVisible,
                          showPasswordStrength: true,
                          controller: passwordController,
                          suffix: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 8) {
                              return 'Password must be at least 8 characters';
                            }
                            if (!RegExp(r'[A-Z]').hasMatch(value)) {
                              return 'Add at least one uppercase letter';
                            }
                            if (!RegExp(r'[a-z]').hasMatch(value)) {
                              return 'Add at least one lowercase letter';
                            }
                            if (!RegExp(r'[0-9]').hasMatch(value)) {
                              return 'Add at least one number';
                            }
                            if (!RegExp(
                              r'[!@#\$%^&*(),.?":{}|<>]',
                            ).hasMatch(value)) {
                              return 'Add at least one special character';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {},
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        MainButton(
                          title: "Login",
                          isEnabled: true,
                          onPressedFunction: () {
                            if (_formKey.currentState!.validate()) {
                              print("Login successful!");
                              print("Email: ${emailController.text}");
                              print("Password: ${passwordController.text}");
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? "),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Create Account",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.01),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
