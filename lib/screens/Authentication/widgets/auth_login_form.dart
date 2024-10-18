

import 'package:e_commerce_app/screens/Authentication/widgets/auth_button.dart';
import 'package:e_commerce_app/screens/Authentication/widgets/auth_button_loading.dart';
import 'package:e_commerce_app/screens/Authentication/widgets/auth_input.dart';
import 'package:e_commerce_app/screens/Authentication/widgets/auth_remember_forgot_password.dart';
import 'package:e_commerce_app/screens/Authentication/widgets/auth_other_service_widget.dart';
import 'package:e_commerce_app/screens/auth_wrapper.dart';
import 'package:flutter/material.dart';

import '../../../services/auth_service.dart';

class AuthLoginForm extends StatefulWidget {
  const AuthLoginForm({super.key});

  @override
  State<AuthLoginForm> createState() => _AuthLoginFormState();
}

class _AuthLoginFormState extends State<AuthLoginForm> {

  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _loading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = AuthService();
    Future<void> onLogin () async {
      setState(() {
        _loading = !_loading;
      });
      await auth.signInUserWithEmailAndPassword(_email.text, _password.text);
      setState(() {
        _loading = false;
      });
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const AuthWrapper()));
    }
    ThemeData themeData = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AuthInput(
          controller: _email,
          labelTitle: 'Email',
          hint: 'example@gmail.com',
        ),
        const SizedBox(
          height: 24,
        ),
        AuthInput(
          controller: _password,
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
        _loading ? const AuthButtonLoading(title:'ON LOADING...') : AuthButtonSubmit(
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
        const AuthOtherServiceWidget(),
      ],
    );
  }
}
