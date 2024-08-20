import 'package:shopsocks/domain/models/product_model.dart';

class FavoriteProduct {
  int userId;
  Product? product;

  FavoriteProduct({required this.userId, this.product});

  factory FavoriteProduct.fromJson(Map<dynamic, dynamic> json) {
    return FavoriteProduct(
        userId: int.parse(json['userId'].toString()),
        product: Product.fromJson(json));
  }

  factory FavoriteProduct.fromJsonOrder(Map<dynamic, dynamic> json) {
    return FavoriteProduct(
        userId: int.parse(json['userId'].toString()),
        product: Product.fromJson(json['product']));
  }

  Map<String, dynamic> toDatabaseJson() =>
      {'userId': this.userId, 'product': this.product!.toDatabaseJson()};
}
