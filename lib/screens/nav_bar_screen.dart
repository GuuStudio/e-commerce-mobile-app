import 'package:e_commerce_app/screens/AddProduct/add_product_screen.dart';
import 'package:e_commerce_app/screens/Cart/cart_screen.dart';
import 'package:e_commerce_app/screens/Favorite/favorite_screen.dart';
import 'package:e_commerce_app/screens/Home/home_screen.dart';
import 'package:e_commerce_app/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const FavoriteScreen(),
    const AddProductScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
              icon: Icon(
                _currentIndex == 0 ? Icons.home : Icons.home_outlined,
                size: 30,
                color: _currentIndex == 0 ? themeData.primaryColor : Colors.grey.shade400,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _currentIndex = 1;
                });
              },
              icon: Icon(
                _currentIndex == 1  ? Icons.favorite  :Icons.favorite_border,
                size: 30,
                color: _currentIndex == 1 ? themeData.primaryColor : Colors.grey.shade400,
              ),
            ),
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: themeData.primaryColor,
              ),
              child: Center(
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      _currentIndex = 2;
                    });
                  },
                  icon: const Icon(
                    Icons.add ,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            IconButton(
              onPressed: () {
                setState(() {
                  _currentIndex = 3;
                });
              },
              icon: Icon(
                _currentIndex == 3 ? Icons.shopping_bag : Icons.shopping_bag_outlined,
                size: 30,
                color: _currentIndex == 3 ? themeData.primaryColor : Colors.grey.shade400,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _currentIndex = 4;
                });
              },
              icon: Icon(
                _currentIndex == 4 ? Icons.person : Icons.person_outline,
                size: 30,
                color: _currentIndex == 4 ? themeData.primaryColor : Colors.grey.shade400,
              ),
            ),
          ],
        ),
      ),
      body: screens[_currentIndex],
    );
  }
}
