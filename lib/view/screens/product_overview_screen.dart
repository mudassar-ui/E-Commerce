import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/products_controller.dart';
import '../../controller/cart_controller.dart';

import '../widgets/product_item.dart';

import '../widgets/badge.dart';

enum FilterOption {
  Favorite,
  All,
}

class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProductsController productsController = Get.put(ProductsController());
    final CartController cartController = Get.put(CartController());
    return Scaffold(
        appBar: AppBar(
          title: Text('Mudassar App'),
          actions: [
            PopupMenuButton(
                onSelected: (FilterOption selectedValue) {
                  if (selectedValue == FilterOption.Favorite) {
                    productsController.showFavorite();
                  } else {
                    productsController.showAll();
                  }
                },
                icon: Icon(Icons.more_vert),
                itemBuilder: (_) => [
                      PopupMenuItem(
                        child: Text('Only Favorite'),
                        value: FilterOption.Favorite,
                      ),
                      PopupMenuItem(
                        child: Text('Show All'),
                        value: FilterOption.All,
                      ),
                    ]),
            Obx(() {
              return Badge(
                child: IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                  ),
                  onPressed: () {
                    //Navigator.of(context).pushNamed(CartScreen.routeName);
                    Get.toNamed('/Cart_Screen');
                  },
                ),
                value: cartController.itemCount.toString(),
              );
            })
          ],
        ),
        body: Obx(() {
          final newProduct = productsController.showfavorites.value
              ? productsController.favoriteItems
              : productsController.products;
          return GridView.builder(
            itemCount: newProduct.length,
            itemBuilder: (ctx, i) {
              return ProductItem(
                // productsController.products[i].id,
                // productsController.products[i].title,
                // productsController.products[i].imageUrl,
                newProduct[i],
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
          );
        }));
  }
}
