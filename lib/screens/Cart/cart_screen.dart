import 'package:e_commerce_app/apps/constants.dart';
import 'package:e_commerce_app/screens/Cart/widgets/cart_app_bar.dart';
import 'package:e_commerce_app/screens/Cart/widgets/cart_checkout.dart';
import 'package:e_commerce_app/screens/Cart/widgets/cart_list_view.dart';
import 'package:flutter/material.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    handleShowSheet () {
      Scaffold.of(context).showBottomSheet((_) => const CartCheckout());
    }
    return Scaffold(
      backgroundColor: kcontentColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CartAppBar(handleShowSheet: handleShowSheet,),
              const SizedBox(
                height: 10,
              ),
              const CartListView(),
            ],
          ),
        ),
      ),
    );
  }
}


