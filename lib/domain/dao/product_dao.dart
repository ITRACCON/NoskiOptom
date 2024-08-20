import 'package:shopsocks/domain/models/product_model.dart';

List<Product> getListProducts(List data) {
  return List.generate(data.length, (id) => Product.fromJson(data[id]));
}