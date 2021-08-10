import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/products_controller.dart';
import '../view/product_item.dart';

class ProductOverviewScreen extends StatelessWidget {
  final ProductsController productsController = Get.put(ProductsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mudassar App'),
      ),
      body: GridView.builder(
        itemCount: productsController.products.length,
        itemBuilder: (ctx, i) {
          return ProductItem(
            productsController.products[i].id,
            productsController.products[i].title,
            productsController.products[i].imageUrl,
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
