import 'package:eqraa_book_store/feature/authentication/cubit/auth_cubit.dart';
import 'package:eqraa_book_store/feature/my_cart/cubit/cart_cubit.dart';
import 'package:eqraa_book_store/feature/authentication/forget_password/forget_password.dart';
import 'package:eqraa_book_store/core/constants/constants.dart';
import 'package:eqraa_book_store/feature/authentication/login/login_screen.dart';
import 'package:eqraa_book_store/feature/authentication/signup/signup_screen.dart';
import 'package:eqraa_book_store/feature/home/model/book_model.dart';
import 'package:hive/hive.dart';
import 'package:eqraa_book_store/feature/main_layout.dart';
import 'package:eqraa_book_store/feature/onboarding/onboarding_screen.dart';
import 'package:eqraa_book_store/feature/splash/splash_screen.dart';
import 'package:eqraa_book_store/feature/my_cart/my_cart_screen.dart';
import 'package:eqraa_book_store/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  await Hive.initFlutter();
  Hive.registerAdapter(BookModelAdapter());
  await Hive.openBox<BookModel>('favorites');
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => CartCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.lexendTextTheme(),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 1.5),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Constants.mainColor,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        routes: {
          "/onboarding": (context) => const OnboardingScreen(),
          "/login": (context) => const LoginScreen(),
          "/signup": (context) => const SignUpScreen(),
          "/forgetpassword": (context) => ForgetPassword(
            email: ModalRoute.of(context)!.settings.arguments as String? ?? "",
          ),
          "/mainlayout": (context) => const MainLayout(),
          "/mycart": (context) => const MyCartScreen(),
        },
      ),
    );
  }
}
