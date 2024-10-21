import 'package:e_commerce_app/apps/constants.dart';
import 'package:e_commerce_app/screens/Cart/widgets/cart_app_bar.dart';
import 'package:e_commerce_app/screens/Cart/widgets/cart_checkout.dart';
import 'package:e_commerce_app/screens/Cart/widgets/cart_list_view.dart';
import 'package:flutter/material.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  bool _showBottomSheet = false;
  @override
  Widget build(BuildContext context) {
    void handleShowSheet () {
      setState(() {
        _showBottomSheet = !_showBottomSheet;
      });
    }
    return Scaffold(
      bottomSheet: _showBottomSheet  ? CartCheckout(showBottomSheet: handleShowSheet,) : null,
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


