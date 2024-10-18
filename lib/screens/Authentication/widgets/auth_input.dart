import 'package:e_commerce_app/apps/constants.dart';
import 'package:flutter/material.dart';

class AuthInput extends StatefulWidget {
  const AuthInput({super.key, required this.hint, required this.labelTitle, this.controller});

  final String labelTitle;
  final String hint;
  final TextEditingController? controller;

  @override
  State<AuthInput> createState() => _AuthInputState();
}

class _AuthInputState extends State<AuthInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.labelTitle, style: const TextStyle(fontSize: 13, color: Colors.black),),
        const SizedBox(height: 8,),
        Container(
          height: 62,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kcontentColor,
          ),
          child: Center(
            child: TextField(
              controller: widget.controller,
              onTapOutside: (e) {
                FocusScope.of(context).unfocus();
              },
              decoration: InputDecoration(
                hintStyle: const TextStyle(color: Colors.grey,),
                hintText: widget.hint,
                border: InputBorder.none ,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
