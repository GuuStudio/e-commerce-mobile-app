
import 'package:flutter/material.dart';

class AuthButtonSubmit extends StatelessWidget {
  const AuthButtonSubmit({super.key, required this.title, required this.onSubMit});

  final Function onSubMit;
  final String title;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return InkWell(
      onTap: () {
        onSubMit();
      },
      child: Container(
        width: double.infinity,
        height: 62,
        decoration: BoxDecoration(
          color: themeData.primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
            child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
        )),
      ),
    );
  }
}
