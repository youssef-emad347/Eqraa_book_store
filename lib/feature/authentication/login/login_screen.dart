import 'package:eqraa_book_store/core/widgets/main_button.dart';
import 'package:eqraa_book_store/feature/authentication/cubit/auth_cubit.dart';
import 'package:eqraa_book_store/feature/authentication/cubit/auth_states.dart';
import 'package:eqraa_book_store/feature/authentication/widget/custom_text_form_feild.dart';
import 'package:eqraa_book_store/feature/authentication/widget/header.dart';
import 'package:eqraa_book_store/feature/authentication/widget/options_login.dart';
import 'package:eqraa_book_store/feature/authentication/widget/or_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  // ✅ Validation بسيطة - Firebase هو اللي هيرفض لو غلط
  String? validateEmail(String value) {
    if (value.isEmpty) return 'Please enter your email';
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) return 'Please enter your password';
    return null;
  }

  bool get _isEmailValid => emailController.text.isNotEmpty;
  bool get _isPasswordValid => passwordController.text.isNotEmpty;

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
                        HeaderCustomWidget(text: "Let's get you Login!"),

                        SizedBox(height: screenHeight * 0.03),

                        Row(
                          children: const [
                            Expanded(
                              child: OptionLogin(
                                text: "Google",
                                image: "assets/google.png",
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: OptionLogin(
                                text: "Apple",
                                image: "assets/apple.png",
                              ),
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
                            onTap: () {
                              if (emailController.text.isNotEmpty) {
                                Navigator.pushNamed(
                                  context,
                                  '/forgetpassword',
                                  arguments: emailController.text,
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Please enter your email first"),
                                    backgroundColor: Colors.orange,
                                  ),
                                );
                              }
                            },
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth * 0.035,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.02),

                        Center(
                          child: BlocConsumer<AuthCubit, AuthStates>(
                            listener: (context, state) {
                              if (state is LoginSuccessState) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(state.message),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                                Navigator.pushReplacementNamed(context, '/mainlayout');
                              } else if (state is LoginErrorState) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(state.message),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            },
                            builder: (context, state) {
                              if (state is LoginLoadingState) {
                                return const CircularProgressIndicator();
                              }
                              return MainButton(
                                title: "Login",
                                isEnabled: _isEmailValid && _isPasswordValid,
                                onPressedFunction: () {
                                  if (_formKey.currentState!.validate()) {
                                    AuthCubit.get(context).login(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                              );
                            },
                          ),
                        ),

                        // ✅ اتشالت الـ SizedBox الكبيرة (0.2) اللي كانت بتخبي الـ Row
                        SizedBox(height: screenHeight * 0.03),

                        // ✅ دلوقتي ظاهرة دايماً
                        Center(
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                "Don't have an account? ",
                                style: TextStyle(fontSize: screenWidth * 0.035),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, "/signup");
                                },
                                child: Text(
                                  "Create Account",
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
