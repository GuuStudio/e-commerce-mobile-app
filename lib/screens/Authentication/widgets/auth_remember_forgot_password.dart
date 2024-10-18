import 'package:e_commerce_app/screens/Authentication/forgot_password_screen.dart';
import 'package:flutter/material.dart';

class AuthRememberForgotPassword extends StatefulWidget {
  const AuthRememberForgotPassword({super.key});

  @override
  State<AuthRememberForgotPassword> createState() => _AuthRememberForgotPasswordState();
}

class _AuthRememberForgotPasswordState extends State<AuthRememberForgotPassword> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            activeColor: themeData.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value;
              });
            },
          ),
          const Text(
            'Remember me',
            style: TextStyle(fontSize: 13),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ForgotPasswordScreen()));
            },
            child: Text(
              'Forgot Password',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: themeData.primaryColor,
              ),
            ),
          ),
          const SizedBox(width: 15,),
        ],
      ),
    );
  }
}
