import 'package:shopsocks/domain/models/user_model.dart';

List<User> getListUser(List data) {
  return List.generate(data.length, (id) => User.fromJson(data[id]));
}