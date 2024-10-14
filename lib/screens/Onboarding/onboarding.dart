import 'package:e_commerce_app/screens/Authentication/login_screen.dart';
import 'package:e_commerce_app/screens/onboarding/widgets/boarding_swiper.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {


  int onboardingIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const BoardingSwiper(),
          const SizedBox(
            height: 16,
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => const LoginScreen(),)
              );
            },
            child: const Text(
              'Skip',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff646982),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
