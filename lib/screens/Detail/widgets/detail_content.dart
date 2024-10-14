import 'package:flutter/material.dart';

import '../../../models/product_model.dart';

class DetailContent extends StatelessWidget {
  const DetailContent({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '\$${product.price}',
                  style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 50,
                      height: 23,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: themeData.primaryColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.star, color: Colors.white, size: 14,),
                          Text(product.rate.toString(), style: const TextStyle(color: Colors.white, fontSize: 13),),
                        ],
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Text(product.review, style: const TextStyle(fontSize: 12, color: Colors.grey),)
                  ],
                )
              ],
            ),
            Text.rich(TextSpan(
              children: [
                const TextSpan(text: 'Seller: ' , style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                TextSpan(text: product.seller, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900))
              ]
            ))
          ],
        )
      ],
    );
  }
}
