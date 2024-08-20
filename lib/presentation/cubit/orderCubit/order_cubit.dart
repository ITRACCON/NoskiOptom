import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopsocks/domain/repository/order_repository.dart';
import 'package:shopsocks/domain/models/basket_model.dart';
part 'order_cubit.freezed.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRepository _orderRepository = OrderRepository();

  OrderCubit() : super(const Loading());

  Future<void> init() async {
    emit(Initial());
  }

  Future<void> placingOrder(
      int userId,
      List<BasketProduct> basketProducts,
      String username,
      String userLogin,
      String phone,
      String deliverly,
      String pay) async {
    print(deliverly);
    print(pay);
    bool result = await _orderRepository.placinOrder(
        userId, basketProducts, username, userLogin, phone, deliverly, pay);
    if (result) {
      emit(Success());
    } else {
      emit(Error());
    }
  }
}
