import 'package:e_commerce_app/services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthOtherServiceWidget extends StatefulWidget {
  const AuthOtherServiceWidget({super.key});

  @override
  State<AuthOtherServiceWidget> createState() => _AuthOtherServiceWidgetState();
}

class _AuthOtherServiceWidgetState extends State<AuthOtherServiceWidget> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    final auth = AuthService();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Or',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(
          height: 22,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 62,
              width: 62,
              decoration: const BoxDecoration(
                color: Color(0xff172E62),
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/images/facebook.png',
                height: 18,
              ),
            ),
            const SizedBox(width: 30,),
            _loading ?  Container(
              height: 62,
              width: 62,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
              ),
              child: const CircularProgressIndicator()
            ): InkWell(
              onTap: () {
                setState(() {
                  _loading = true;
                });
                auth.signInWithEmail();
                setState(() {
                  _loading = false;
                });
              },
              child: Container(
                height: 62,
                width: 62,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/google_logo.png',
                ),
              ),
            ),
            const SizedBox(width: 30,),
            Container(
              height: 62,
              width: 62,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/images/apple.png',
                height: 18,
              ),
            ),
          ],
        )
      ],
    );
  }
}
