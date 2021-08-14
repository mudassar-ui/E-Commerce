import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import '../../controller/order_controller.dart';
import 'package:get/get.dart';
import '/model/order.dart';

class OrderProduct extends StatelessWidget {
  final OrderItems newOrders;

  OrderProduct(this.newOrders);

  //var total = 0.obs;
  @override
  Widget build(BuildContext context) {
    final OrderController orderController = Get.put(OrderController());
    print(newOrders.id);
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text(
              '\$${newOrders.amount}',
            ),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(
                newOrders.dateTime,
              ),
            ),
            trailing: IconButton(
              icon: Obx(() {
                return Icon(orderController.expanded.value
                    ? Icons.expand_less
                    : Icons.expand_more);
              }),
              onPressed: () {
                orderController.expand();
              },
            ),
          ),
          if (orderController.expanded.value)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: min(newOrders.products.length * 20.0 + 50, 100),
              child: ListView(
                children: newOrders.products
                    .map(
                      (prod) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            prod.title,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${prod.quantity}* \$${prod.price}',
                            style: TextStyle(fontSize: 18, color: Colors.amber),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
