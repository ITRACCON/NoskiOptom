import 'dart:convert';
import 'dart:math';
import 'package:shopsocks/data/server/http_client.dart';
import 'package:shopsocks/domain/dao/basket_dao.dart';
import 'package:shopsocks/domain/dao/favorite_dao.dart';
import 'package:shopsocks/domain/dao/order_dao.dart';
import 'package:shopsocks/domain/dao/product_dao.dart';
import 'package:shopsocks/domain/dao/user_dao.dart';
import 'package:shopsocks/data/cfg.dart';
import 'package:shopsocks/domain/models/basket_model.dart';
import 'package:shopsocks/domain/models/favorite_product.dart';
import 'package:shopsocks/domain/models/order_model.dart';
import 'package:shopsocks/domain/models/product_model.dart';
import 'package:shopsocks/domain/models/user_model.dart';

class AppApi {
  // Получение пользователя
  Future<Map<String, dynamic>> getUser(int idTg) async {
    try {
      Map request = await AppHttpClient.post(
          AppConfing.userApi, {'action': 'GET_USER', 'userID': idTg});

      if (request['result']) {
        Map body = request['body'];
        User user = User.fromJson(body);
        return {'result': true, 'user': user};
      } else {
        return {'result': false};
      }
    } catch (e) {
      return {'result': false};
    }
  }

  // Получение каталога
  Future<Map<String, dynamic>> getProducts(String category) async {
    try {
      Map request = await AppHttpClient.post(AppConfing.productsApi,
          {'action': 'GET_ALL_PRODUCTS', 'category': category});

      if (request['result']) {
        Map body = request['body'];
        List data = body['list'];
        List<Product> products = getListProducts(data);
        return {'result': true, 'products': products};
      } else {
        return {'result': false};
      }
    } catch (e) {
      return {'result': false};
    }
  }

  // Получение корзины
  Future<Map<String, dynamic>> getBasket(int userId) async {
    try {
      Map request = await AppHttpClient.post(AppConfing.basketApi,
          {'action': 'GET_USER_BASKET', 'userID': userId});

      if (request['result']) {
        Map body = request['body'];
        List data = body['list'];
        List<BasketProduct> basketProducts = getListBasketProducts(data);
        return {'result': true, 'basketProducts': basketProducts};
      } else {
        return {'result': false};
      }
    } catch (e) {
      return {'result': false};
    }
  }

  // Проверка на наличие товара в корзине
  Future<Map<String, dynamic>> getProductBasket(
      int userId, String productId) async {
    try {
      Map request = await AppHttpClient.post(AppConfing.basketApi, {
        'action': 'GET_PRODUCT_BASKET',
        'userID': userId,
        'productID': productId
      });

      if (request['result']) {
        Map body = request['body'];
        List data = body['list'];
        if (data.isEmpty) {
          BasketProduct basketProduct = BasketProduct(amount: 0);
          return {'result': true, 'basketProduct': basketProduct};
        } else {
          BasketProduct basketProduct = BasketProduct.fromJson(data[0]);
          return {'result': true, 'basketProduct': basketProduct};
        }
      } else {
        return {'result': false};
      }
    } catch (e) {
      print(e);
      return {'result': false};
    }
  }

  // Добавление товара в корзину
  Future<Map<String, dynamic>> addProductBasket(int userId, String productID,
      int amount, String userName, String userFL) async {
    try {
      Map request = await AppHttpClient.post(AppConfing.basketApi, {
        'action': 'ADD_PRODUCT_BASKET',
        'userID': userId,
        'userName': userName,
        'userFL': userFL,
        'productID': productID,
        'amount': amount
      });

      if (request['result']) {
        return {
          'result': true,
        };
      } else {
        return {'result': false};
      }
    } catch (e) {
      print(e);
      return {'result': false};
    }
  }

// Увелечение кол. товара в корзине
  Future<Map<String, dynamic>> addAmountBasketProduct(
      int userId, String productID, int amount) async {
    try {
      Map request = await AppHttpClient.post(AppConfing.basketApi, {
        'action': 'ADD_BASKET_PRODUCT',
        'userID': userId,
        'productID': productID,
        'amount': amount
      });

      if (request['result']) {
        return {
          'result': true,
        };
      } else {
        return {'result': false};
      }
    } catch (e) {
      print(e);
      return {'result': false};
    }
  }

  // Уменьшение кол. товара в корзине
  Future<Map<String, dynamic>> minusAmountBasketProduct(
      int userId, String productID, int amount) async {
    try {
      Map request = await AppHttpClient.post(AppConfing.basketApi, {
        'action': 'MINUS_BASKET_PRODUCT',
        'userID': userId,
        'productID': productID,
        'amount': amount
      });

      if (request['result']) {
        return {
          'result': true,
        };
      } else {
        return {'result': false};
      }
    } catch (e) {
      print(e);
      return {'result': false};
    }
  }

  // Удаление товара из корзины
  Future<Map<String, dynamic>> remuveProductBasket(
      int userId, String productID) async {
    try {
      Map request = await AppHttpClient.post(AppConfing.basketApi, {
        'action': 'REMOVE_PRODUCT_BASKET',
        'userID': userId,
        'productID': productID
      });

      if (request['result']) {
        return {
          'result': true,
        };
      } else {
        return {'result': false};
      }
    } catch (e) {
      print(e);
      return {'result': false};
    }
  }

// Оформление заказа
  Future<bool> placingOrder(
      int userId,
      List<BasketProduct> basketProducts,
      String username,
      String userLogin,
      String phone,
      String deliverly,
      String pay) async {
    String listTovar = '';
    int payMoney = 0;
    List photos = [];
    try {
      String orderId = generateRandomString(10);
      basketProducts.forEach((basket) {
        listTovar += '''
🆔 <b>Артикул:</b> ${basket.product!.article}
🏷 <b>Название:</b> ${basket.product!.title}
🗃 <b>Колличество:</b> ${basket.amount}
💵 <b>Стоимость:</b> ${(basket.product!.price * basket.amount).round()} ₽ ''';

        payMoney += (basket.product!.price * basket.amount).round();
      });

      basketProducts.forEach((basket) => photos.add({
            'media': basket.product!.photo.toString(),
            'type': 'photo',
            'caption': '''
🆔 <b>Артикул:</b> ${basket.product!.article}
🏷 <b>Название:</b> ${basket.product!.title}
🗃 <b>Колличество:</b> ${basket.amount}
💵 <b>Стоимость:</b> ${basket.product!.price * basket.amount} ₽ ''',
            "parse_mode": "HTML",
          }));
      List prodList = [];
      basketProducts.forEach((basket) => prodList.add(basket.toDatabaseJson()));
      Map request = await AppHttpClient.post(AppConfing.orderApi, {
        'action': 'ADD_ORDER',
        'userID': userId,
        'userName': userLogin,
        'userFL': username,
        'products': json.encode(prodList),
        'orderID': orderId
      });

      if (request['result']) {
        await AppHttpClient.apiTg(AppConfing.sendMediaGroup, {
          'chat_id': AppConfing.idAdmin.toString(),
          'media': json.encode(photos),
          "parse_mode": "HTML",
        });

        Map reqTgSendMessage =
            await AppHttpClient.apiTg(AppConfing.sendMessage, {
          'chat_id': AppConfing.idAdmin.toString(),
          'text': '''
📦 <b>Новый заказ! № Заказа:</b> #$orderId 
🛒 <b>Товары:</b>

$listTovar
👤 Информация о покупателе: 
🆔 <b>Телеграмм:</b> $username (@$userLogin)
☎️ <b>Телефон:</b> <code>$phone</code>

🚚 <b>Cпособ доставки:</b> $deliverly
💳 <b>Cпособ оплаты:</b> $pay

💳 <b>Итого:</b> $payMoney ₽ 

#новыйзаказ #продажи
''',
          "parse_mode": "HTML",
        });

        if (reqTgSendMessage['result']) {
          Map reqTgClearBasket = await AppHttpClient.post(AppConfing.basketApi,
              {'action': 'CLEAR_BASKET', 'userID': userId});

          if (reqTgClearBasket['result']) {
            Map reqTgSendMessageUser =
                await AppHttpClient.apiTg(AppConfing.sendMessage, {
              'chat_id': '$userId',
              'text': '''
🎉 Поздравляем! Ваш заказ был успешно оформлен. 
<b>№ Заказа:</b> #$orderId 

🛒 <b>Товары:</b>
$listTovar
💳 <b>Итого:</b> $payMoney ₽

🚚 <b>Cпособ доставки:</b> $deliverly
💳 <b>Cпособ оплаты:</b> $pay
Ожидайте когда с вами свяжутся. Спасибо, что выбрали нас! 🚚🛍️
''',
              "parse_mode": "HTML"
            });

            if (reqTgSendMessageUser['result']) {
              return true;
            } else {
              return false;
            }
          } else {
            return false;
          }
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Добавление товара в каталог
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
    try {
      Map requestOrders = await AppHttpClient.post(AppConfing.adminApi, {
        'action': 'ADD_PRODUCT',
        'article': article,
        'title': title,
        'price': price,
        'desc': description,
        'size': size,
        'minamount': minamount,
        'base64Image': base64Image,
        'fileName': fileName,
        'categorie': categorie
      });
      String categ = '';
      if (requestOrders['result']) {
        if (categorie == 'muzhskie') {
          categ = 'Мужские';
        } else if (categorie == 'ledi') {
          categ = 'Женские';
        } else if (categorie == 'kid') {
          categ = 'Детские';
        } else if (categorie == 'winter') {
          categ = 'Зимние';
        }
        Map reqTgSendMessage = await AppHttpClient.apiTg(AppConfing.sendPhoto, {
          'chat_id': '-1001904479992',
          'photo': '${AppConfing.serverAddress}/images/$fileName',
          'caption': '''<b>$title</b>

🔖 <b>Артикул:</b> <code>$article</code>  
💵 <b>Цена за пару:</b> $price ₽ (опт) 
📦 <b>В мешке:</b> $minamount пар 
💰 <b>Цена за мешок:</b> ${(double.parse(price) * int.parse(minamount)).round()} ₽
📏 <b>Размер:</b> $size 

———————————————-
🧑‍💻 <a href='https://t.me/geva13'>Live консультант</a>
🛍 <a href='https://t.me/Optomnoskibot'>Заказать через телеграм</a>
🛒 <a href='https://optom-noski.com/'>Интернет магазин</a>

#$categ
''',
          "parse_mode": "HTML",
        });

        if (reqTgSendMessage['result']) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Удаление товара из каталога
  Future<bool> deleteProduct(String article) async {
    try {
      Map requestOrders = await AppHttpClient.post(AppConfing.adminApi, {
        'action': 'DELETE_PRODUCT',
        'article': article,
      });

      if (requestOrders['result']) {
        Map body = requestOrders['body'];
        if (body['result'] == 'delete') {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Получение информации о товаре для редактирования
  Future<Map> getEditProduct(String article) async {
    try {
      Map requestOrders = await AppHttpClient.post(AppConfing.adminApi, {
        'action': 'GET_EDIT_PRODUCT',
        'article': article,
      });

      if (requestOrders['result']) {
        Map body = requestOrders['body'];
        if (body['result']['result'] == 'suc') {
          Product product = Product.fromJson(body['result']['product']);

          return {'result': true, 'product': product};
        } else {
          return {'result': false};
        }
      } else {
        return {'result': false};
      }
    } catch (e) {
      print(e);
      return {'result': false};
    }
  }

// Редактирование товара
  Future<bool> editProduct(
      String article,
      String title,
      String price,
      String description,
      String size,
      String minamount,
      String categorie) async {
    try {
      Map requestEdit = await AppHttpClient.post(AppConfing.adminApi, {
        'action': 'EDIT_PRODUCT',
        'article': article,
        'title': title,
        'price': price,
        'desc': description,
        'size': size,
        'minamount': minamount,
        'categorie': categorie
      });

      if (requestEdit['result']) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

// Массовое добавление товара
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
    try {
      Map requestMassAdd = await AppHttpClient.post(AppConfing.adminApi, {
        'action': 'ADD_MASS_PRODUCT',
        'article': article,
        'title': title,
        'price': price,
        'desc': description,
        'size': size,
        'minamount': minamount,
        'photourl': urlPhoto,
        'fileName': fileName,
        'categorie': categorie
      });
      if (requestMassAdd['result']) {
        Map body = json.decode(requestMassAdd['body']);

        return {'result': true, 'log': body['result']};
      } else {
        return {'result': false};
      }
    } catch (e) {
      print(e);
      return {'result': false};
    }
  }

// Сообщение в тг канал
  Future<Map> tgMessChanel(String article, String title, double price,
      String size, String minamount, String fileName, String categorie) async {
    try {
      String categ = '';

      if (categorie == 'muzhskie') {
        categ = 'Мужские';
      } else if (categorie == 'ledi') {
        categ = 'Женские';
      } else if (categorie == 'kid') {
        categ = 'Детские';
      } else if (categorie == 'winter') {
        categ = 'Зимние';
      }
      Map requestMassAdd = await AppHttpClient.apiTg(AppConfing.sendPhoto, {
        'chat_id': '-1001904479992',
        'photo': '${AppConfing.serverAddress}/images/$fileName',
        'caption': '''<b>$title</b>

🔖 <b>Артикул:</b> <code>$article</code> 
💵 <b>Цена за пару:</b> $price ₽ (опт) 
📦 <b>В мешке:</b> $minamount пар 
💰 <b>Цена за мешок:</b> ${(price * int.parse(minamount)).round()} ₽
📏 <b>Размер:</b> $size 

———————————————-
🧑‍💻 <a href='https://t.me/geva13'>Live консультант</a>
🛍 <a href='https://t.me/Optomnoskibot'>Заказать через телеграм</a>
🛒 <a href='https://optom-noski.com/'>Интернет магазин</a>

#$categ
''',
        "parse_mode": "HTML",
      });
      if (requestMassAdd['result']) {
        return {'result': true};
      } else {
        await Future.delayed(Duration(seconds: 3));
        Map resTg = await tgMessChanel(
            article, title, price, size, minamount, fileName, categorie);
        if (resTg['result']) {
          return {'result': true};
        } else {
          return {'result': false};
        }
      }
    } catch (e) {
      print(e);
      return {'result': false};
    }
  }

  // Получение статистики и информации
  Future<Map<String, dynamic>> getStats() async {
    try {
      Map requestGet = await AppHttpClient.post(
          AppConfing.adminApi, {'action': 'GET_STATS'});

      if (requestGet['result']) {
        Map body = requestGet['body'];
        List usersData = body['users']['list'];

        List<User> users = getListUser(usersData);

        List ordersData = body['orders']['list'];
        List basketUsersData = body['basketAllUsers']['list'];

        List<OrderUser> orders = getListUserOrders(ordersData);
        List<BasketProductStats> basketProductStat =
            getListBasketProductsStat(basketUsersData);

        return {
          'result': true,
          'users': users,
          'orders': orders,
          'basketProductStat': basketProductStat
        };
      } else {
        return {'result': false};
      }
    } catch (e) {
      print(e);
      return {'result': false};
    }
  }

  // Получение избранных товаров
  Future<Map<String, dynamic>> getFavorite(int userId) async {
    try {
      Map request = await AppHttpClient.post(AppConfing.favoritesApi,
          {'action': 'GET_USER_FAVORITE', 'userID': userId});

      if (request['result']) {
        Map body = request['body'];
        List data = body['list'];
        List<FavoriteProduct> favoriteProduct = getListFavoriteProducts(data);
        return {'result': true, 'favoriteProduct': favoriteProduct};
      } else {
        return {'result': false};
      }
    } catch (e) {
      print(e);
      return {'result': false};
    }
  }

  // Получение избранного товара
  Future<Map<String, dynamic>> getProductFavorite(
      int userId, String productId) async {
    try {
      Map request = await AppHttpClient.post(AppConfing.favoritesApi, {
        'action': 'GET_PRODUCT_FAVORITE',
        'userID': userId,
        'productID': productId
      });

      if (request['result']) {
        Map body = request['body'];
        List data = body['list'];
        if (data.isEmpty) {
          FavoriteProduct favoriteProduct = FavoriteProduct(userId: userId);
          return {'result': true, 'favoriteProduct': favoriteProduct};
        } else {
          FavoriteProduct favoriteProduct = FavoriteProduct.fromJson(data[0]);
          return {'result': true, 'favoriteProduct': favoriteProduct};
        }
      } else {
        return {'result': false};
      }
    } catch (e) {
      print(e);
      return {'result': false};
    }
  }

  // Добавление товара в избранное
  Future<Map<String, dynamic>> addProductFavorite(
      int userId, String productID) async {
    try {
      Map request = await AppHttpClient.post(AppConfing.favoritesApi, {
        'action': 'ADD_PRODUCT_FAVORITE',
        'userID': userId,
        'productID': productID
      });

      if (request['result']) {
        return {
          'result': true,
        };
      } else {
        return {'result': false};
      }
    } catch (e) {
      print(e);
      return {'result': false};
    }
  }

  // Удаление товара из избранных
  Future<Map<String, dynamic>> remuveProductFavorite(
      int userId, String productID) async {
    try {
      Map request = await AppHttpClient.post(AppConfing.favoritesApi, {
        'action': 'REMOVE_PRODUCT_FAVORITE',
        'userID': userId,
        'productID': productID
      });

      if (request['body']) {
        return {
          'result': true,
        };
      } else {
        return {'result': false};
      }
    } catch (e) {
      print(e);
      return {'result': false};
    }
  }

// Проверка на пустату корзины
  Future<Map<String, dynamic>> basketIsEmpty(int userId) async {
    try {
      Map request = await AppHttpClient.post(AppConfing.basketApi,
          {'action': 'CHECK_BASKET_USER', 'userID': userId});

      if (request['result']) {
        bool basketIsEmpt = request['body']['result'];
        return {'result': true, 'basketIsEmpty': basketIsEmpt};
      } else {
        return {'result': false};
      }
    } catch (e) {
      print(e);
      return {'result': false};
    }
  }

// Проверка на пустату избранных
  Future<Map<String, dynamic>> favoriteIsEmpty(int userId) async {
    try {
      Map request = await AppHttpClient.post(AppConfing.favoritesApi,
          {'action': 'CHECK_FAVORITE_USER', 'userID': userId});

      if (request['result']) {
        bool favoriteIsEmpt = request['body']['result'];
        return {'result': true, 'favoriteIsEmpty': favoriteIsEmpt};
      } else {
        return {'result': false};
      }
    } catch (e) {
      print(e);
      return {'result': false};
    }
  }
}

String generateRandomString(int len) {
  var r = Random();
  const _chars = '1234567890';
  return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
}
