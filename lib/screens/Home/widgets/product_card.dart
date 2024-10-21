import 'package:e_commerce_app/apps/constants.dart';
import 'package:e_commerce_app/providers/favorite_provider.dart';
import 'package:e_commerce_app/screens/Detail/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/product_model.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = context.watch<FavoriteProvider>();
    ThemeData themeData = Theme.of(context);
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: [
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailScreen(product: widget.product)),
            ),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: kcontentColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Hero(
                      tag: widget.product.image,
                      child: Image.asset(
                        'assets/${widget.product.image}',
                        width: 130,
                        height: 130,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      widget.product.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${widget.product.price}',
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: List.generate(productsColors.length, (index) {
                            return Container(
                              width: 18,
                              height: 18,
                              decoration:
                                  BoxDecoration(color:  productsColors[index], shape: BoxShape.circle),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: InkWell(
              onTap: () {
                setState(() {
                  favoriteProvider.toggleFavorite(widget.product);
                });
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: themeData.primaryColor,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10), topRight: Radius.circular(20)),
                ),
                child: Icon(
                     favoriteProvider.hasFavorite(widget.product) ? Icons.favorite : Icons.favorite_border_outlined ,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
