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

  final RegExp _emailRegex = RegExp(
    r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
  );

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? validateEmail(String value) {
    if (value.isEmpty) return 'Please enter your email';
    if (!_emailRegex.hasMatch(value)) return 'Please enter a valid email';
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) return 'Please enter your password';
    if (value.length < 8) return 'Password must be at least 8 characters';
    if (!RegExp(r'[A-Z]').hasMatch(value)) return 'Add uppercase letter';
    if (!RegExp(r'[a-z]').hasMatch(value)) return 'Add lowercase letter';
    if (!RegExp(r'[0-9]').hasMatch(value)) return 'Add number';
    if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Add special character';
    }
    return null;
  }

  bool get _isEmailValid => validateEmail(emailController.text) == null;
  bool get _isPasswordValid =>
      validatePassword(passwordController.text) == null;

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
                          children: const [
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
                          onChanged: (_) => setState(() {}),
                          validator: (value) => validateEmail(value ?? ''),
                        ),

                        SizedBox(height: screenHeight * 0.01),

                        CustomTextFormField(
                          hint: "Password",
                          prefixIcon: Icons.lock_outlined,
                          obscure: !_isPasswordVisible,
                          controller: passwordController,
                          onChanged: (_) => setState(() {}),
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
                          validator: (value) => validatePassword(value ?? ''),
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

                        Center(
                          child: MainButton(
                            title: "Login",
                            isEnabled: _isEmailValid && _isPasswordValid,
                            onPressedFunction: () {
                              if (_formKey.currentState!.validate()) {
                                debugPrint("Login successful");
                                debugPrint(emailController.text);
                              }
                            },
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.2),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account? "),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, "/signup");
                              },
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
