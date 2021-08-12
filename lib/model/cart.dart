class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });

  //To print string of CartItem Object on Consule
  @override
  String toString() {
    return 'CartItem: {id: $id, title: $title,quantity: $quantity, price: $price}';
  }
}
