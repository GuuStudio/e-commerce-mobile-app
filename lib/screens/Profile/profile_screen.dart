import 'package:e_commerce_app/apps/constants.dart';
import 'package:e_commerce_app/screens/profile/wigets/profile_app_bar.dart';
import 'package:e_commerce_app/screens/profile/wigets/profile_list_products.dart';
import 'package:e_commerce_app/screens/profile/wigets/profile_overview.dart';
import 'package:e_commerce_app/screens/profile/wigets/profile_user_name.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SingleChildScrollView(
         child: SafeArea(
           child: Container(
             color: kcontentColor,
             padding: const EdgeInsets.symmetric(horizontal: 20),
             child: const Column(
               children: [
                 SizedBox(height: 10,),
                 ProfileAppBar(),
                 SizedBox(height: 20,),
                  ProfileUserName(),
                 SizedBox(height: 20,),
                 ProfileOverview(),
                 SizedBox(height: 20,),
                 ProfileListProducts()
               ],
             ),
           ),
         ),
       ),
    );
  }
}
