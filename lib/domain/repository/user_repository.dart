import 'package:shopsocks/data/server/api.dart';

class UserRepository {
  final AppApi _appApi = AppApi();
// Получение данных о пользователе
  Future<Map> getUser(int idTg) async {
    Map res = await _appApi.getUser(idTg);
    return res;
  }
}
