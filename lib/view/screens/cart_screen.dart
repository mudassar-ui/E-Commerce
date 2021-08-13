import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../controller/cart_controller.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    //label: Text(cart.totalAmount.toString()),
                    label: Obx(() {
                      return Text(
                        '\$${cartController.totalAmount.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Theme.of(context)
                              .primaryTextTheme
                              .headline6!
                              .color,
                        ),
                      );
                    }),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text('Order Now'),
                    textColor: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (ctx, i) => CartItem(
                      cartController.cartItems.values.toList()[i].id,
                      cartController.cartItems.keys.toList()[i],
                      cartController.cartItems.values.toList()[i].price,
                      cartController.cartItems.values.toList()[i].title,
                      cartController.cartItems.values.toList()[i].quantity,
                    )),
          ),
        ],
      ),
    );
  }
}
