import 'package:e_commerce_app/screens/Authentication/verify_screen.dart';
import 'package:e_commerce_app/screens/Onboarding/onboarding.dart';
import 'package:e_commerce_app/screens/nav_bar_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError ) {
          return const Center(
            child: Text('Error'),
          );
        } else {
          if (snapshot.data == null ) {
            return const OnboardingPage();
          } else {
            if(snapshot.data!.emailVerified == true) {
              return const BottomNavBar();
            }
            return const VerifyScreen();
          }

        }
       },),
    );
  }
}
