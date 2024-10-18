
import 'package:e_commerce_app/apps/constants.dart';
import 'package:e_commerce_app/screens/Profile/widgets/profile_app_bar.dart';
import 'package:e_commerce_app/screens/Profile/widgets/profile_list_products.dart';
import 'package:e_commerce_app/screens/Profile/widgets/profile_overview.dart';
import 'package:e_commerce_app/screens/Profile/widgets/profile_user_name.dart';
import 'package:e_commerce_app/services/auth_service.dart';

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthService();
    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Log Out'),
              onTap: () {
                auth.signOut();
              },
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
              },
            ),
          ],
        ),
      ),
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
