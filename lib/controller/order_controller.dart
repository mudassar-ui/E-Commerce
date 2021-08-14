import 'package:get/get.dart';
import '../model/order.dart';
import '../model/cart.dart';

class OrderController extends GetxController {
  final orders = <OrderItems>[].obs;
  final expanded = false.obs;

  //this method add orders

  void addOrder(List<CartItem> cartProducts, double total) {
    orders.add(
      OrderItems(
        id: DateTime.now().toString(),
        amount: total,
        products: cartProducts,
        dateTime: DateTime.now(),
      ),
    );
    print('add order : ${orders}');
  }

  void expand() {
    expanded.value = !expanded.value;
  }
}
