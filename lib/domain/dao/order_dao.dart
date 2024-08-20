import 'package:shopsocks/domain/models/order_model.dart';

List<OrderUser> getListUserOrders(List data) {
  return List.generate(data.length, (id) => OrderUser.fromJson(data[id]));
}
