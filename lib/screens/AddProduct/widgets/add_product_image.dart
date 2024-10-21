import 'package:flutter/material.dart';

class AddProductImage extends StatelessWidget {
  const AddProductImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 150,
      height: 150,
      child: CircleAvatar(
        child: Icon(Icons.photo_camera, size: 30,),
      ),
    );
  }
}
