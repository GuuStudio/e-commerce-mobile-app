import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/product_model.dart';
import '../../../providers/cart_provider.dart';
import 'cart_product_card.dart';

class CartListView extends StatelessWidget {
  const CartListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();
    final List<Product> cards = cartProvider.productInCart;
    return ListView.separated(
      shrinkWrap: true,
      controller: ScrollController(),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => CartProductCard(product: cards[index], index: index,),
      separatorBuilder: (context, index) => const SizedBox(
        height: 20,
      ),
      itemCount: cards.length,
    );
  }
}
