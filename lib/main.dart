import 'package:eqraa_book_store/feature/authentication/cubit/auth_cubit.dart';
import 'package:eqraa_book_store/feature/authentication/forget_password/forget_password.dart';
import 'package:eqraa_book_store/feature/authentication/login/login_screen.dart';
import 'package:eqraa_book_store/feature/authentication/signup/signup_screen.dart';
import 'package:eqraa_book_store/feature/onboarding/onboarding_screen.dart';
import 'package:eqraa_book_store/feature/splash/splash_screen.dart';
import 'package:eqraa_book_store/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        routes: {
          "/onboarding": (context) => OnboardingScreen(),
          "/login": (context) => LoginScreen(),
          "/signup": (context) => SignUpScreen(),
          "/forgetpassword": (context) => ForgetPassword(),
        },
      ),
    );
  }
}
