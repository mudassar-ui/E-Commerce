import 'package:flutter/material.dart';
import '../../model/product.dart';
import 'package:get/get.dart';
import '../../controller/cart_controller.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Get.toNamed('/Product_Details_Screen', arguments: product.id);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: IconButton(
            icon: Obx(() => Icon(product.isFavorite.value
                ? Icons.favorite
                : Icons.favorite_border)),
            color: Theme.of(context).accentColor,
            onPressed: () {
              product.toggleFavorite();
            },
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Theme.of(context).accentColor,
            onPressed: () {
              cartController.addItem(product.id, product.price, product.title);
            },
          ),
        ),
      ),
    );
  }
}
