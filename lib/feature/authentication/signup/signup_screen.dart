import 'package:eqraa_book_store/core/widgets/main_button.dart';
import 'package:eqraa_book_store/feature/authentication/widget/custom_text_form_feild.dart';
import 'package:eqraa_book_store/feature/authentication/widget/header.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isPasswordVisible = false;

  final RegExp _emailRegex = RegExp(
    r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
  );

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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
                        HeaderCustomWidget(text: "Register your account"),

                        SizedBox(height: screenHeight * 0.03),

                        CustomTextFormField(
                          hint: "Your Name",
                          prefixIcon: Icons.person_outline,
                          controller: nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: screenHeight * 0.0025),

                        CustomTextFormField(
                          hint: "Email",
                          prefixIcon: Icons.email_outlined,
                          controller: emailController,
                          onChanged: (value) {
                            setState(() {});
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }

                            if (!_emailRegex.hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }

                            return null;
                          },
                        ),

                        SizedBox(height: screenHeight * 0.0025),

                        CustomTextFormField(
                          hint: "Your Phone",
                          prefixIcon: Icons.phone_outlined,
                          controller: phoneController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }

                            if (!RegExp(r'^\d{11}$').hasMatch(value)) {
                              return 'Please enter a valid 11-digit phone number';
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
                          onChanged: (value) {
                            setState(() {});
                          },
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

                        SizedBox(height: screenHeight * 0.0025),

                        CustomTextFormField(
                          hint: "Confirm Password",
                          prefixIcon: Icons.lock_outlined,
                          obscure: !_isPasswordVisible,
                          controller: confirmPasswordController,
                          onChanged: (value) {
                            setState(() {});
                          },
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
                              return 'Please confirm your password';
                            }

                            if (value != passwordController.text) {
                              return 'Passwords do not match';
                            }

                            return null;
                          },
                        ),
                        SizedBox(height: screenHeight * 0.03),

                        Center(
                          child: MainButton(
                            title: "Sign Up",
                            isEnabled: true,
                            onPressedFunction: () {
                              if (_formKey.currentState!.validate()) {
                                debugPrint("Sign up successful!");
                                debugPrint("Email: ${emailController.text}");
                                debugPrint(
                                  "Password: ${passwordController.text}",
                                );
                              }
                            },
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an account? "),

                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, "/login");
                              },
                              child: const Text(
                                "Login",
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
