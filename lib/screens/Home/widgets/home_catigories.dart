import 'package:e_commerce_app/models/category_model.dart';
import 'package:flutter/material.dart';

class HomeCatigories extends StatelessWidget {
  const HomeCatigories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 135,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
            return Column(
              children: [
                Container(
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/${categoriesList[index].image}'),
                        fit: BoxFit.cover,
                      )),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  categoriesList[index].title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: 15,
              ),
          itemCount: categoriesList.length),
    );
  }
}
