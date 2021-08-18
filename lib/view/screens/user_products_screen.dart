import 'package:flutter/material.dart';

import '../widgets/user_products_item.dart';
import '../widgets/app_drawer.dart';
//import '../screens/edit_product_screen.dart';
import 'package:get/get.dart';
import '../../controller/products_controller.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = '/user-product';
  final ProductsController productsController = Get.find();
  @override
  Widget build(BuildContext context) {
    final productsData = productsController;
    return Scaffold(
      appBar: AppBar(
        title: Text('Yor Product'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Navigator.of(context).pushNamed(EditProductScreen.routeName);
              Get.toNamed('/edit_products_screen');
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Obx(() {
          return ListView.builder(
            itemCount: productsData.products.length,
            itemBuilder: (context, i) => Column(
              children: [
                UserProductItem(
                  productsData.products[i].title,
                  productsData.products[i].imageUrl,
                  productsData.products[i].id,
                ),
                Divider(),
              ],
            ),
          );
        }),
      ),
    );
  }
}
