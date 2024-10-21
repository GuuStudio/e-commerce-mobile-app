import 'package:e_commerce_app/apps/constants.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/screens/AddProduct/widgets/add_product_appbar.dart';
import 'package:e_commerce_app/screens/AddProduct/widgets/add_product_custom_dropdown.dart';
import 'package:e_commerce_app/screens/AddProduct/widgets/add_product_image.dart';
import 'package:e_commerce_app/screens/AddProduct/widgets/add_product_textfield.dart';
import 'package:e_commerce_app/services/api_service.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _title = TextEditingController();
  final _description = TextEditingController();
  final _price = TextEditingController();
  final _quantity = TextEditingController();
  String _category = 'All';

  onChangeCategory(String cate) {
    setState(() {
      _category = cate;
    });
  }

  onSubmit() {
    final product = Product(title: _title.text,
      review: '0',
      description: _description.text,
      image: 'https://img.freepik.com/free-vector/realistic-display-smartphone-with-different-apps_52683-30241.jpg?t=st=1729503159~exp=1729506759~hmac=0ac024cd01cec64a76c6826327977ebe603e62f81118f2d8898c248e6085544e&w=740',
      price: double.parse(_price.text),
      seller: 'seller',
      category: _category,
      rate: 4,
      quantity: int.parse(_quantity.text),);
    ApiService().createProduct(product);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Thêm sản phẩm thành công')),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Container(
          color: kcontentColor,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const AddProductAppbar(),
                const SizedBox(
                  height: 20,
                ),
                const AddProductImage(),
                const SizedBox(
                  height: 30,
                ),
                AddProductTextField(label: 'Your product title?', hint: 'Title...', controller: _title,),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: (MediaQuery
                          .sizeOf(context)
                          .width / 2) - 30,
                      child: AddProductTextField(
                        controller: _quantity,
                        hint: '0',
                        label: 'Quantity?',
                        isNumber: true,
                      ),
                    ),
                    SizedBox(
                      width: (MediaQuery
                          .sizeOf(context)
                          .width / 2) - 30,
                      child: AddProductTextField(
                        controller: _price,
                        hint: '0.0',
                        label: 'Price?',
                        isNumber: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                AddProductCustomDropdown(label: 'Choice Categories', onchange: onChangeCategory,),
                const SizedBox(
                  height: 15,
                ),
                AddProductTextField(
                  controller: _description,
                  label: 'Your product description?',
                  hint: 'Description...',
                  isTextArea: true,
                  max: 1000,
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: onSubmit,
                  child: Container(
                    width: 300,
                    height: 70,
                    decoration: BoxDecoration(
                      color: themeData.primaryColor,
                      borderRadius: BorderRadius.circular(70),
                    ),
                    child: const Center(
                      child: Text(
                        'Add Product',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
