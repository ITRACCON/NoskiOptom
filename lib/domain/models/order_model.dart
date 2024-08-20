import 'dart:convert';

import 'package:shopsocks/domain/dao/basket_dao.dart';
import 'package:shopsocks/domain/models/basket_model.dart';

class OrderUser {
  int userId;
  String userName;
  String userFL;
  String orderId;
  List<BasketProduct> order;

  OrderUser(
      {required this.userId,
      required this.userName,
      required this.userFL,
      required this.orderId,
      required this.order});

  factory OrderUser.fromJson(Map<dynamic, dynamic> json) {
    return OrderUser(
        userId: int.parse(json['userId']),
        orderId: json['orderId'],
        userName: json['userName'],
        userFL: json['userFL'],
        order: getListBasketProductsOrder(jsonDecode(json['products'])));
  }

  Map<String, dynamic> toDatabaseJson() =>
      {'userId': this.userId, 'orderId': this.orderId};
}
