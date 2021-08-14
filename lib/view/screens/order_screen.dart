import 'package:flutter/material.dart';
import '../../controller/order_controller.dart';
import '../widgets/app_drawer.dart';

import 'package:get/get.dart';

import '../widgets/order_item.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    //final ordersData = Provider.of<Order>(context);

    print(orderController.orders);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: Obx(() {
        return ListView.builder(
          itemCount: orderController.orders.length,
          itemBuilder: (ctx, i) => OrderProduct(
            orderController.orders[i],
          ),
        );
      }),
    );
  }
}
