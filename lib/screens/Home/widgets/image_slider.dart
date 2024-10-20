import 'package:e_commerce_app/apps/constants.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({
    super.key,
    required this.currentSlide,
    required this.onChange,
  });

  final Function(int) onChange;
  final int currentSlide;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Stack(
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: PageView(
              scrollDirection: Axis.horizontal,
              allowImplicitScrolling: true,
              onPageChanged: onChange,
              physics: const ClampingScrollPhysics(),
              children: [
                Image.asset(
                  'assets/images/slider.jpg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/image1.png',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/slider3.png',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          bottom: 5,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => AnimatedContainer(
                  duration: const Duration(microseconds: 300),
                  width: currentSlide == index ? 15 : 8,
                  height: 8,
                  margin: const EdgeInsets.only(right: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: currentSlide == index ? themeData.primaryColor : kcontentColor,
                      border: Border.all(style: BorderStyle.none)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
