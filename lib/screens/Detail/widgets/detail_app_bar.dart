import 'package:e_commerce_app/providers/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/product_model.dart';

class DetailAppBar extends StatelessWidget {
  const DetailAppBar({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = context.watch<FavoriteProvider>();
    final bool isHasFavorite = favoriteProvider.hasFavorite(product);
    ThemeData themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.all(15),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            iconSize: 30,
            icon: const Center(child: Icon(Icons.arrow_back_ios_new, color: Colors.black54,),),
          ),
          const Spacer(),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.all(15),
            ),
            onPressed: () {},
            iconSize: 30,
            icon: const Icon(Icons.share_outlined,
            color: Colors.black54,),
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: isHasFavorite ? themeData.primaryColor : Colors.white,
              padding: const EdgeInsets.all(15),
            ),
            onPressed: () {
              favoriteProvider.toggleFavorite(product);
            },
            iconSize: 30,
            icon: Icon(
              isHasFavorite ? Icons.favorite : Icons.favorite_border_outlined,
              color: isHasFavorite ? Colors.white : Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
