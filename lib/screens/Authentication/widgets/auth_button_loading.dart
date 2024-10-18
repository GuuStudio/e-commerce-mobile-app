import 'package:flutter/material.dart';

class AuthButtonLoading extends StatelessWidget {
  const AuthButtonLoading({super.key, required this.title, this.color});

  final Color? color;
  final String title;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      width: double.infinity,
      height: 62,
      decoration: BoxDecoration(
        color: color ?? themeData.primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
          ),
          const SizedBox(width: 10,),
          const SizedBox(
            width: 14,
            height: 14,
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        ],
      )),
    );
  }
}
