import 'package:get/get.dart';
import '../model/cart.dart';

class CartController extends GetxController {
  var cartItems = <String, CartItem>{}.obs;
  var showOnlyFavorites = false.obs;

  int get itemCount {
    return cartItems.length;
  }

  void addItem(
    String productId,
    double price,
    String title,
  ) {
    if (cartItems.containsKey(productId)) {
      cartItems.update(
          productId,
          (existingCartItem) => CartItem(
                id: existingCartItem.id,
                title: existingCartItem.title,
                quantity: existingCartItem.quantity + 1,
                price: existingCartItem.price,
              ));
    } else {
      cartItems.putIfAbsent(
          productId,
          () => CartItem(
                id: DateTime.now().toString(),
                title: title,
                quantity: 1,
                price: price,
              ));
    }
  }
}
