import 'dart:async';

import 'package:e_commerce_app/apps/constants.dart';
import 'package:e_commerce_app/screens/Authentication/widgets/auth_button.dart';
import 'package:e_commerce_app/screens/Authentication/widgets/auth_button_loading.dart';
import 'package:e_commerce_app/screens/Authentication/widgets/auth_input.dart';
import 'package:e_commerce_app/screens/auth_wrapper.dart';
import 'package:e_commerce_app/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _email = TextEditingController();
  bool _loading = false;
  final auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        Align(
          alignment: Alignment.centerLeft,
          child: InkWell(
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
            },
            child: const Icon(Icons.west, weight: 2, ),),
        )
        ,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Forgot Password', style: TextStyle(color: Colors.black, fontSize: 40),),
            const SizedBox(height: 50,),
            AuthInput(hint: 'Email...', labelTitle: 'EMAIL', controller: _email,),
            const SizedBox(height: 20,),
            _loading
                ? const AuthButtonLoading(
                    title: 'Loading',
                  )
                : AuthButtonSubmit(
                    title: 'Send',
                    onSubMit: () async {
                      setState(() {
                        _loading = true;
                      });
                      await auth.sendPasswordResetLink(_email.text);
                      setState(() {
                        _loading = false;
                      });
                    },
                  ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
