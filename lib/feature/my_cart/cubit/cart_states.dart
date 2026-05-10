abstract class CartStates {}

class CartInitialState extends CartStates {}

class CartLoadingState extends CartStates {}

class CartUpdatedState extends CartStates {
  final List<CartItemModel> items;
  final double total;

  CartUpdatedState({required this.items, required this.total});
}

class CartItemModel {
  final String id;
  final String title;
  final String author;
  final String imageUrl;
  final double price;
  int quantity;

  CartItemModel({
    required this.id,
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.price,
    this.quantity = 1,
  });
}
