import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';
import '../../controller/order_controller.dart';
import 'package:get/get.dart';

import '../widgets/order_item.dart';

class OrderScreen extends StatelessWidget {
  //final OrderController orderController = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    //final ordersData = Provider.of<Order>(context);

    // print(orderController.orders);

    return Scaffold(
        appBar: AppBar(
          title: Text('Your Orders'),
        ),
        drawer: AppDrawer(),
        body: GetBuilder<OrderController>(
          init: OrderController(),
          builder: (orderController) => ListView.builder(
            itemCount: orderController.orders.length,
            itemBuilder: (ctx, i) => OrderProduct(
              orderController.orders[i],
            ),
          ),
        ));
  }
}
