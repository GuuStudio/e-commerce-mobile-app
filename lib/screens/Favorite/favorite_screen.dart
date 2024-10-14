import 'package:e_commerce_app/screens/Favorite/widgets/favorite_list_view.dart';
import 'package:flutter/material.dart';

import '../../apps/constants.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kcontentColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),              
              SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text('Favorite', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),),
                ),
              ),              
              SizedBox(
                height: 10,
              ),
              FavoriteListView(),
            ],
          ),
        ),
      ),
    );
  }
}
