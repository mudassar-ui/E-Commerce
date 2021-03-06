import 'package:get/get.dart';

class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final isFavorite = false.obs;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }
}
