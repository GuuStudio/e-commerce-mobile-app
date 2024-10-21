import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/models/product_model.dart';

class CustomCategory {
  String id;
  String title;
  CustomCategory({
    required this.id, required this.title,
});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }

  factory CustomCategory.fromMap(Map<String, dynamic> map) {
    return CustomCategory(
      id: map['id'] as String,
      title: map['title'] as String,
    );
  }
}
final List<CustomCategory> customCategoriesList = [
  CustomCategory(
    id: '1',
    title: "All",
  ),
  CustomCategory(
    id: '2',
    title: "Shoes",
  ),
  CustomCategory(
    id: '3',
    title: "Beauty",
  ),
  CustomCategory(
    id: '4',
    title: "Women's\nFashion",
  ),
  CustomCategory(
    id: '6',
    title: "Jewelry",
  ),
  CustomCategory(
    id: '7',
    title: "Men's\nFashion",
  ),
];
class ApiService {
  Future<List<CustomCategory>?> getCategories() async {
    try{
      final data = await FirebaseFirestore.instance.collection('categories').get();
      final listData = data.docs.map((doc) => CustomCategory.fromMap(doc.data())).toList();

      return listData;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
  
  Future<void> createProduct(Product product) async {
    try {
      await FirebaseFirestore.instance.collection('products').add(product.toMap());
    }catch (e) {
      log(e.toString());
    }
  }
}