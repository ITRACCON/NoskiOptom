import 'package:shopsocks/domain/models/product_model.dart';

class BasketProduct {
  int amount;
  Product? product;

  BasketProduct({required this.amount, this.product});

  factory BasketProduct.fromJson(Map<dynamic, dynamic> json) {
    return BasketProduct(
        amount: int.parse(json['amount'].toString()),
        product: Product.fromJson(json));
  }

  factory BasketProduct.fromJsonOrder(Map<dynamic, dynamic> json) {
    return BasketProduct(
        amount: int.parse(json['amount'].toString()),
        product: Product.fromJson(json['product']));
  }

  Map<String, dynamic> toDatabaseJson() =>
      {'amount': this.amount, 'product': this.product!.toDatabaseJson()};
}

class BasketProductStats {
  int userId;
  String username;
  String userfl;
  int amountBasket;
  List<BasketProduct> order;

  BasketProductStats(
      {required this.userId,
      required this.username,
      required this.userfl,
      required this.amountBasket,
      required this.order});

  factory BasketProductStats.fromJson(Map<dynamic, dynamic> json) {
    return BasketProductStats(
        userId: int.parse(json['userId'].toString()),
        username: json['userName'].toString(),
        userfl: json['userFl'].toString(),
        amountBasket: 0,
        order: []);
  }
}
