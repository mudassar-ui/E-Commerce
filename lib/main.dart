import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shop_app_getx/view/screens/product_details_screen.dart';
import 'package:shop_app_getx/view/screens/product_overview_screen.dart';
import 'package:shop_app_getx/view/screens/cart_screen.dart';

import 'view/screens/product_overview_screen.dart';

import 'view/screens/order_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
      ],
    );
  }
}
