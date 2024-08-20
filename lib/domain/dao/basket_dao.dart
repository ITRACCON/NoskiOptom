import 'package:shopsocks/domain/models/basket_model.dart';

List<BasketProduct> getListBasketProducts(List data) {
  return List.generate(data.length, (id) => BasketProduct.fromJson(data[id]));
}

List<BasketProduct> getListBasketProductsOrder(List data) {
  return List.generate(
      data.length, (id) => BasketProduct.fromJsonOrder(data[id]));
}

List<BasketProductStats> getListBasketProductsStat(List data) {
  List<BasketProductStats> list = [];
  int indexElement = 0;

  data.forEach((row) {
    final orderL =
        list.where((order) => order.userId.toString() == row['userId']);

    if (orderL.isNotEmpty) {
      list[indexElement - 1].order.add(BasketProduct.fromJson(row));
      list[indexElement - 1].amountBasket++;
    } else {
      list.add(BasketProductStats.fromJson(row));
      list[indexElement].order.add(BasketProduct.fromJson(row));
      list[indexElement].amountBasket++;
      indexElement++;
    }
  });
  return list;
}
