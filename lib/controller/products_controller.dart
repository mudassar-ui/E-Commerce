import 'package:get/get.dart';
import '../model/product.dart';

class ProductsController extends GetxController {
  final products = <Product>[
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ].obs;

  final showfavorites = false.obs;

  List<Product> get favoriteItems {
    return products.where((prod) => prod.isFavorite.value).toList();
  }

  void showFavorite() {
    showfavorites.value = true;
  }

  void showAll() {
    showfavorites.value = false;
  }

  Product findById(String id) {
    return products.firstWhere((prod) => prod.id == id);
  }

  void addProduct(Product product) {
    final newProduct = Product(
        id: DateTime.now().toString(),
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl);
    products.add(newProduct);
  }

  //edit existing product
  void updateProduct(String id, Product newProduct) {
    final prodIndex = products.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      products[prodIndex] = newProduct;
    } else {
      print('...');
    }
  }

  void deleteProduct(String id) {
    products.removeWhere((prod) => prod.id == id);
  }
}
