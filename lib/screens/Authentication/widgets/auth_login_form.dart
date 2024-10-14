import 'package:e_commerce_app/screens/Authentication/widgets/auth_button.dart';
import 'package:e_commerce_app/screens/Authentication/widgets/auth_input.dart';
import 'package:e_commerce_app/screens/Authentication/widgets/auth_remember_forgot_password.dart';
import 'package:e_commerce_app/screens/Authentication/widgets/auth_services.dart';
import 'package:flutter/material.dart';

class AuthLoginForm extends StatefulWidget {
  const AuthLoginForm({super.key});

  @override
  State<AuthLoginForm> createState() => _AuthLoginFormState();
}

class _AuthLoginFormState extends State<AuthLoginForm> {
  onLogin() => Navigator.pushReplacementNamed(context, '/sign-up');

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AuthInput(
          labelTitle: 'Email',
          hint: 'example@gmail.com',
        ),
        const SizedBox(
          height: 24,
        ),
        const AuthInput(
          labelTitle: 'PASSWORD',
          hint: '************',
        ),
        const SizedBox(
          height: 24,
        ),
        const AuthRememberForgotPassword(),
        const SizedBox(
          height: 24,
        ),
        AuthButtonSubmit(
          title: 'LOG IN',
          onSubMit: onLogin,
        ),
        const SizedBox(
          height: 38,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Don’t have an account?',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/sign-up');
              },
              child: Center(
                child: Text(
                  'SIGN UP',
                  style: TextStyle(
                    fontSize: 16,
                    color: themeData.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 22,
        ),
        const AuthServices(),
      ],
    );
  }
}
