import 'package:e_commerce_app/screens/profile/wigets/profile_product_card.dart';
import 'package:flutter/material.dart';

import '../../../models/product_model.dart';

class ProfileListProducts extends StatelessWidget {
  const ProfileListProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Products',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            controller: ScrollController(),
            itemBuilder: (context, index) => ProfileProductCard(product: all[index], index: index),
            separatorBuilder: (context, index) => const SizedBox(height: 20,),
            itemCount: all.length,
          )
        ],
      ),
    );
  }
}
