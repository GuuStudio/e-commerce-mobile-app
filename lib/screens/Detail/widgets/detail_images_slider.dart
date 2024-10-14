import 'package:flutter/material.dart';

class DetailImagesSlider extends StatelessWidget {
  const DetailImagesSlider({
    super.key,
    required this.onChange,
    required this.image,
  });

  final Function(int) onChange;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PageView.builder(
        onPageChanged: onChange,
        itemBuilder: (context, index) {
          return Hero(
              tag: image,
              child: Image.asset('assets/$image'));
        },
        itemCount: 3,
      ),
    );
  }
}
