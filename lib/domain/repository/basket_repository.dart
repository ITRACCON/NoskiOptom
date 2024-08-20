import 'package:shopsocks/data/server/api.dart';

class BasketRepository {
  final AppApi _appApi = AppApi();
// Получение данных о пользователе
  Future<Map> getBasket(int userId) async {
    Map res = await _appApi.getBasket(userId);
    return res;
  }

  Future<Map> isEmpty(int userId) async {
    Map res = await _appApi.basketIsEmpty(userId);
    return res;
  }

  Future<Map> getProductBasket(int userId, String productId) async {
    Map res = await _appApi.getProductBasket(userId, productId);
    return res;
  }

  Future<bool> addProductBasket(int userId, String productId, int amount,
      String userName, String userFL) async {
    Map res = await _appApi.addProductBasket(
        userId, productId, amount, userName, userFL);
    return res['result'];
  }

  Future<bool> addAmountBasketProduct(
      int userId, String productId, int amount) async {
    Map res = await _appApi.addAmountBasketProduct(userId, productId, amount);
    return res['result'];
  }

  Future<bool> minusAmountBasketProduct(
      int userId, String productId, int amount) async {
    Map res = await _appApi.minusAmountBasketProduct(userId, productId, amount);
    return res['result'];
  }

  Future<bool> remuveProductBasket(int userId, String productId) async {
    Map res = await _appApi.remuveProductBasket(userId, productId);
    return res['result'];
  }
}
