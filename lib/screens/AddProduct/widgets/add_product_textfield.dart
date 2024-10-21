import 'package:flutter/material.dart';

class AddProductTextField extends StatelessWidget {
  const AddProductTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.isTextArea = false,
    this.isNumber = false,
    this.obscureText = false, this.max = 30,
  });

  final String label;
  final bool isTextArea;
  final bool isNumber;

  final String hint;
  final TextEditingController controller;
  final bool? obscureText;
  final int? max;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            label,
            style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w800),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Card(
          color: Colors.white,
          child: Container(
            width: double.infinity,
            height: isTextArea ? 200 : null,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
              onTapOutside: (_) {
                FocusScope.of(context).unfocus();
              },
              maxLength: max,
              obscureText: obscureText ??  false,
              maxLines: null,
              keyboardType: isNumber ? TextInputType.number :  TextInputType.multiline,
              controller: controller,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle:
                    const TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.w600),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
