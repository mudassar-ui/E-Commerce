import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shop_app_getx/view/product_overview_screen.dart';

import 'view/product_overview_screen.dart';

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
      // getPages: [
      //   GetPage(name: '/edit_product', page: () => EditProducts()),
      // ],
    );
  }
}