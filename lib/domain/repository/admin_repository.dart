import 'package:shopsocks/data/server/api.dart';

class AdminRepository {
  final AppApi _appApi = AppApi();
// Получение данных о пользователе
  Future<Map> getStats() async {
    Map res = await _appApi.getStats();
    return res;
  }

  Future<Map> tgMessChanel(String article, String title, double price,
      String size, String minamount, String fileName, String categorie) async {
    Map res = await _appApi.tgMessChanel(
        article, title, price, size, minamount, fileName, categorie);
    return res;
  }

  Future<bool> deleteProduct(String article) async {
    bool res = await _appApi.deleteProduct(article);
    return res;
  }

  Future<Map> getEditProduct(String article) async {
    Map res = await _appApi.getEditProduct(article);
    return res;
  }

  Future<bool> editProduct(
      String article,
      String title,
      String price,
      String description,
      String size,
      String minamount,
      String category) async {
    bool res = await _appApi.editProduct(
        article, title, price, description, size, minamount, category);
    return res;
  }
}
