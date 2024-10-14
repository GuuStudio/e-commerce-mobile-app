import 'package:e_commerce_app/providers/cart_provider.dart';
import 'package:e_commerce_app/providers/favorite_provider.dart';
import 'package:e_commerce_app/screens/Authentication/login_screen.dart';
import 'package:e_commerce_app/screens/Authentication/signup_screen.dart';
import 'package:e_commerce_app/screens/nav_bar_screen.dart';
import 'package:e_commerce_app/screens/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.mulishTextTheme(),
          primaryColor: const Color(0xff172E62),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const OnboardingPage(),
          '/sign-in': (context) => const LoginScreen(),
          '/sign-up': (context) => const SignUpScreen(),
          '/home': (context) => const BottomNavBar(),
        },
      )
    );
  }
}
