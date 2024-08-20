import 'package:shopsocks/data/server/api.dart';

class FavoriteRepository {
  final AppApi _appApi = AppApi();
// Получение данных о пользователе
  Future<Map> getFavorite(int userId) async {
    Map res = await _appApi.getFavorite(userId);
    return res;
  }

  Future<Map> isEmpty(int userId) async {
    Map res = await _appApi.favoriteIsEmpty(userId);
    return res;
  }

  Future<Map> getProductFavorite(int userId, String productId) async {
    Map res = await _appApi.getProductFavorite(userId, productId);
    return res;
  }

  Future<bool> addProductFavorite(int userId, String productId) async {
    Map res = await _appApi.addProductFavorite(userId, productId);
    return res['result'];
  }

  Future<bool> remuveProductFavorite(int userId, String productId) async {
    Map res = await _appApi.remuveProductFavorite(userId, productId);
    return res['result'];
  }
}
