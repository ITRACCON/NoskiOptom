import 'package:shopsocks/data/server/api.dart';
import 'package:shopsocks/domain/models/basket_model.dart';

class OrderRepository {
  final AppApi _appApi = AppApi();
// Получение данных о пользователе
  Future<bool> placinOrder(
      int userId,
      List<BasketProduct> basketProducts,
      String username,
      String userLogin,
      String phone,
      String deliverly,
      String pay) async {
    bool res = await _appApi.placingOrder(
        userId, basketProducts, username, userLogin, phone, deliverly, pay);
    return res;
  }
}
