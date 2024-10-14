import 'package:e_commerce_app/screens/Authentication/widgets/auth_button.dart';
import 'package:e_commerce_app/screens/Authentication/widgets/auth_input.dart';
import 'package:flutter/material.dart';

class AuthSignUpForm extends StatefulWidget {
  const AuthSignUpForm({super.key});

  @override
  State<AuthSignUpForm> createState() => _AuthSignUpFormState();
}

class _AuthSignUpFormState extends State<AuthSignUpForm> {
  onSignIn () => Navigator.pushReplacementNamed(context, '/home');
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AuthInput(labelTitle: 'NAME',hint: 'John Doe',),
        const SizedBox(height: 24,),
        const AuthInput(labelTitle: 'Email',hint: 'Example@gmail.com',),
        const SizedBox(height: 24,),
        const AuthInput(labelTitle: 'PASSWORD',hint: '************',),
        const SizedBox(height: 25,),
        const AuthInput(labelTitle: 'CONFIRM-PASSWORD',hint: '************',),
        const SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Really have an account?',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/sign-in');
              },
              child: Center(
                child: Text(
                  'LOG IN',
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
        const SizedBox(height: 10,),
        AuthButtonSubmit(title: 'SIGN UP',onSubMit: onSignIn,),
      ],
    );
  }
}
