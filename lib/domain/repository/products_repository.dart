import 'package:shopsocks/data/server/api.dart';

class ProductsRepository {
  final AppApi _appApi = AppApi();
// Получение данных о пользователе
  Future<Map> getProducts(String category) async {
    Map res = await _appApi.getProducts(category);
    return res;
  }

  Future<bool> addProduct(
      String article,
      String title,
      String price,
      String description,
      String size,
      String minamount,
      String base64Image,
      String fileName,
      String categorie) async {
    bool res = await _appApi.addProduct(article, title, price, description,
        size, minamount, base64Image, fileName, categorie);
    return res;
  }

  Future<Map> addMassProduct(
      String article,
      String title,
      String price,
      String description,
      String size,
      String minamount,
      String urlPhoto,
      String fileName,
      String categorie) async {
    Map res = await _appApi.addMassProduct(article, title, price, description,
        size, minamount, urlPhoto, fileName, categorie);
    return res;
  }
}
