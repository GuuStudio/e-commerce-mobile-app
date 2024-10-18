import 'package:e_commerce_app/screens/Authentication/widgets/auth_bottom_sheet.dart';
import 'package:e_commerce_app/screens/Authentication/widgets/auth_login_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: const AuthBottomSheetContainer(child: AuthLoginForm(),),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/onboarding/backgroundAuth.png'),
            fit: BoxFit.cover,
          ),
        ),
        width: double.infinity,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 118,
            ),
            Text(
              'Log In',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              'Please sign in to your existing account',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
