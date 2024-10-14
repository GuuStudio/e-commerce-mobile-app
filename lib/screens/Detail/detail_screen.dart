import 'package:e_commerce_app/screens/Detail/widgets/detail_addto_cart.dart';
import 'package:e_commerce_app/screens/Detail/widgets/detail_app_bar.dart';
import 'package:e_commerce_app/screens/Detail/widgets/detail_content.dart';
import 'package:e_commerce_app/screens/Detail/widgets/detail_description.dart';
import 'package:e_commerce_app/screens/Detail/widgets/detail_images_slider.dart';
import 'package:flutter/material.dart';

import '../../apps/constants.dart';
import '../../models/product_model.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.product});

  final Product product;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int currentImage = 0;
  int currentColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:  DetailAddToCart(product:  widget.product,),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              // for appbar comeback and favorite
              DetailAppBar(product: widget.product,),
              //   for image slider
              DetailImagesSlider(
                  onChange: (index) {
                    setState(() {
                      currentImage = index;
                    });
                  },
                  image: widget.product.image),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return AnimatedContainer(
                    duration: const Duration(microseconds: 300),
                    width: currentImage == index ? 15 : 8,
                    height: 8,
                    margin: const EdgeInsets.only(right: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: currentImage == index ? Colors.black : kcontentColor,
                      border: Border.all(color: Colors.black),
                    ),
                  );
                }),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                ),
                padding: const EdgeInsets.only(top: 20, right: 20, bottom: 150, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //   for productname, price, rating and seller
                    DetailContent(product: widget.product),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Color',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: List.generate(widget.product.colors.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              currentColor = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: 35,
                            height: 35,
                            padding: const EdgeInsets.all(3),
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color:
                                  currentColor == index ? Colors.white : widget.product.colors[index],
                              shape: BoxShape.circle,
                              border: currentColor == index
                                  ? Border.all(color: widget.product.colors[index])
                                  : null,
                            ),
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: widget.product.colors[index]),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  //   for description
                    DetailDescription(text: widget.product.description),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
