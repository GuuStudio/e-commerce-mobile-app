import 'dart:async';

import 'package:e_commerce_app/apps/constants.dart';
import 'package:e_commerce_app/screens/Authentication/widgets/auth_button.dart';
import 'package:e_commerce_app/screens/Authentication/widgets/auth_button_loading.dart';
import 'package:e_commerce_app/screens/auth_wrapper.dart';
import 'package:e_commerce_app/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  bool _loading = false;
  late Timer timer;
  final auth = AuthService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    auth.sendEmailVertifyLink();
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      FirebaseAuth.instance.currentUser?.reload();
      if (FirebaseAuth.instance.currentUser?.emailVerified == true) {
        timer.cancel();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const AuthWrapper()));
      }
    });
  }

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
        color: kcontentColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text:
                      'We have send an email for verification. If you have not received an email. Please tap on Resend',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                )),
            const SizedBox(
              height: 16,
            ),
            _loading
                ? const AuthButtonLoading(
                    title: 'Loading',
                  )
                : AuthButtonSubmit(
                    title: 'Resend',
                    onSubMit: () async {
                      setState(() {
                        _loading = true;
                      });
                      await auth.sendEmailVertifyLink();
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
