import 'package:eqraa_book_store/core/widgets/main_button.dart';
import 'package:eqraa_book_store/feature/authentication/cubit/auth_cubit.dart';
import 'package:eqraa_book_store/feature/authentication/cubit/auth_states.dart';
import 'package:eqraa_book_store/feature/authentication/widget/custom_text_form_feild.dart';
import 'package:eqraa_book_store/feature/authentication/widget/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
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

                        // ── Name Field ──
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

                        // ── Email Field ──
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

                        // ── Phone Field ──
                        CustomTextFormField(
                          hint: "Your Phone",
                          prefixIcon: Icons.phone_outlined,
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }

                            // يقبل أرقام دولية زي:
                            // +201234567890
                            // +966501234567
                            // 01234567890
                            if (!RegExp(r'^\+?[0-9]{10,15}$').hasMatch(value)) {
                              return 'Please enter a valid phone number';
                            }

                            return null;
                          },
                        ),
                        SizedBox(height: screenHeight * 0.0025),

                        // ── Password Field ──
                        CustomTextFormField(
                          hint: "Password",
                          prefixIcon: Icons.lock_outlined,
                          obscure: !_isPasswordVisible,
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
                          // ✅ رسالة واحدة بس لو الباسورد ناقص شرط - التفاصيل في الـ widget تحت
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 8 ||
                                !RegExp(r'[A-Z]').hasMatch(value) ||
                                !RegExp(r'[a-z]').hasMatch(value) ||
                                !RegExp(r'[0-9]').hasMatch(value) ||
                                !RegExp(
                                  r'[!@#\$%^&*(),.?":{}|<>]',
                                ).hasMatch(value)) {
                              return 'Please complete all password requirements above';
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: screenHeight * 0.0025),

                        // ── Confirm Password Field ──
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

                        // ── Sign Up Button ──
                        Center(
                          child: BlocConsumer<AuthCubit, AuthStates>(
                            listener: (context, state) {
                              if (state is SignUpSuccessState) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(state.message),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                                Navigator.pushReplacementNamed(
                                  context,
                                  "/mainlayout",
                                );
                              } else if (state is SignUpErrorState) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(state.message),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            },
                            builder: (context, state) {
                              if (state is SignUpLoadingState) {
                                return const CircularProgressIndicator();
                              }
                              return MainButton(
                                title: "Sign Up",
                                isEnabled: true,
                                onPressedFunction: () {
                                  if (_formKey.currentState!.validate()) {
                                    AuthCubit.get(context).signUp(
                                      name: nameController.text,
                                      email: emailController.text,
                                      phone: phoneController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                              );
                            },
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.02),

                        SizedBox(height: screenHeight * 0.02),

                        Center(
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                "Already have an account? ",
                                style: TextStyle(fontSize: screenWidth * 0.035),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, "/login");
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: screenWidth * 0.035,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
