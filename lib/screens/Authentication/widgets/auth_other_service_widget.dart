import 'package:flutter/material.dart';

class AuthOtherServiceWidget extends StatelessWidget {
  const AuthOtherServiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
            Container(
              height: 62,
              width: 62,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/images/twist.png',
                height: 18,
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
