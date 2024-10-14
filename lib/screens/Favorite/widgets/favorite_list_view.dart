import 'package:e_commerce_app/providers/favorite_provider.dart';
import 'package:e_commerce_app/screens/Favorite/widgets/favorite_product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/product_model.dart';


class FavoriteListView extends StatelessWidget {
  const FavoriteListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = context.watch<FavoriteProvider>();
    final List<Product> favorites = favoriteProvider.favoriteProducts;
    return ListView.separated(
      shrinkWrap: true,
      controller: ScrollController(),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => FavoriteProductCard(product: favorites[index], index: index,),
      separatorBuilder: (context, index) => const SizedBox(
        height: 20,
      ),
      itemCount: favorites.length,
    );
  }
}
