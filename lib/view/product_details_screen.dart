import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/products_controller.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductsController productsController = Get.put(ProductsController());
  final id = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final loadedProduct = productsController.findById(id);
    print(loadedProduct);
    return Scaffold(
      appBar: AppBar(
        title: Text('${loadedProduct.title}'),
      ),
    );
  }
}
