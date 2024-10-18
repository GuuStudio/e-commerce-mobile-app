
import 'package:e_commerce_app/screens/Authentication/widgets/auth_button.dart';
import 'package:e_commerce_app/screens/Authentication/widgets/auth_button_loading.dart';
import 'package:e_commerce_app/screens/Authentication/widgets/auth_input.dart';
import 'package:e_commerce_app/screens/auth_wrapper.dart';
import 'package:e_commerce_app/services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthSignUpForm extends StatefulWidget {
  const AuthSignUpForm({super.key});

  @override
  State<AuthSignUpForm> createState() => _AuthSignUpFormState();
}

class _AuthSignUpFormState extends State<AuthSignUpForm> {

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  final auth = AuthService();
  bool _loading = false;
  Future<void> onSignUp() async {
    setState(() {
      _loading = true;
    });
    if (_password.text == _confirmPassword.text) {
      await auth.createUserWithEmailAndPassword(_email.text, _password.text);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const AuthWrapper()));
    }
    setState(() {
      _loading = false;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _name.dispose();
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
  }
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AuthInput(
          controller: _name,
          labelTitle: 'NAME',
          hint: 'John Doe',
        ),
        const SizedBox(
          height: 24,
        ),
        AuthInput(
          controller: _email,
          labelTitle: 'Email',
          hint: 'Example@gmail.com',
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
          height: 25,
        ),
         AuthInput(
          controller: _confirmPassword,
          labelTitle: 'CONFIRM-PASSWORD',
          hint: '************',
        ),
        const SizedBox(
          height: 15,
        ),
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
        const SizedBox(
          height: 10,
        ),
        _loading ? const AuthButtonLoading(title: 'Loading') :  AuthButtonSubmit(
          title: 'SIGN UP',
          onSubMit: onSignUp,
        ),
      ],
    );
  }
}
