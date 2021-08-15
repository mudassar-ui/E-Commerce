import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shop_app_getx/controller/cart_controller.dart';
import 'package:shop_app_getx/controller/products_controller.dart';
import 'package:shop_app_getx/view/screens/product_details_screen.dart';
import 'package:shop_app_getx/view/screens/product_overview_screen.dart';
import 'package:shop_app_getx/view/screens/cart_screen.dart';
import 'package:shop_app_getx/view/screens/user_products_screen.dart';

import 'view/screens/product_overview_screen.dart';

import 'view/screens/order_screen.dart';
import '../../controller/order_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final ProductsController productsController = Get.put(ProductsController());
  final OrderController orderController = Get.put(OrderController());
  final CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Shop',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.deepOrange,
        fontFamily: 'Lato',
      ),
      home: ProductOverviewScreen(),
      getPages: [
        GetPage(
            name: '/Product_Overview_Screen',
            page: () => ProductOverviewScreen()),
        GetPage(
            name: '/Product_Details_Screen',
            page: () => ProductDetailsScreen()),
        GetPage(name: '/Cart_Screen', page: () => CartScreen()),
        GetPage(name: '/order_screen', page: () => OrderScreen()),
        GetPage(name: '/user_products_screen', page: () => UserProductScreen()),
      ],
    );
  }
}
