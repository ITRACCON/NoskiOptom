import 'package:shopsocks/domain/models/favorite_product.dart';

List<FavoriteProduct> getListFavoriteProducts(List data) {
  return List.generate(data.length, (id) => FavoriteProduct.fromJson(data[id]));
}
