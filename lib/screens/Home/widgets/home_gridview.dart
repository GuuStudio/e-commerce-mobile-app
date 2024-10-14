import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/screens/Home/widgets/product_card.dart';
import 'package:flutter/material.dart';

class HomeGridview extends StatelessWidget {
  const HomeGridview({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        itemCount: all.length,
        itemBuilder: (context, index) {
          return ProductCard(product: all[index]);
        });
  }
}
