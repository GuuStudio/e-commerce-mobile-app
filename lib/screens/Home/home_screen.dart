import 'package:e_commerce_app/screens/Home/widgets/home_app_bar.dart';
import 'package:e_commerce_app/screens/Home/widgets/home_catigories.dart';
import 'package:e_commerce_app/screens/Home/widgets/home_gridview.dart';
import 'package:e_commerce_app/screens/Home/widgets/image_slider.dart';
import 'package:e_commerce_app/screens/Home/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentSlider = 0;

  void onChange(value) {
    setState(() {
      _currentSlider = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // for custom appbar
              const CustomAppBar(),
              const SizedBox(height: 20,),
              // for search bar
              const CustomSearchBar(),
              const SizedBox(
                height: 20,
              ),
              ImageSlider(currentSlide: _currentSlider, onChange: onChange),
              const SizedBox(
                height: 20,
              ),
              //   for category
              const HomeCatigories(),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Special for you',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                  ),
                  InkWell(
                    child: Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              //   For shopping items
              const HomeGridview(),
            ],
          ),
        ),
      ),
    );
  }
}
