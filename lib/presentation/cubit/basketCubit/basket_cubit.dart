import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopsocks/domain/repository/basket_repository.dart';
import 'package:shopsocks/domain/models/basket_model.dart';

part 'basket_cubit.freezed.dart';

part 'basket_state.dart';

class BasketCubit extends Cubit<BasketState> {
  final BasketRepository _basketRepository = BasketRepository();

  BasketCubit() : super(const Loading());

  Future<void> initialBasket(int userId) async {
    emit(const Loading());
    Map result = await _basketRepository.getBasket(userId);
    if (result['result']) {
      List<BasketProduct> basketProducts = result['basketProducts'];
      emit(Intial(basketProducts));
    } else {
      emit(const Error());
    }
  }

  Future<void> getProductBasket(int userId, String productId) async {
    Map result = await _basketRepository.getProductBasket(userId, productId);

    if (result['result']) {
      BasketProduct basketProduct = result['basketProduct'];
      emit(IntialProduct(basketProduct));
    } else {
      emit(const Error());
    }
  }

  Future<void> addProductBasket(int userId, String productId, int amount,
      String userName, String userFL) async {
    await _basketRepository.addProductBasket(
        userId, productId, amount, userName, userFL);
    Map result = await _basketRepository.getProductBasket(userId, productId);

    if (result['result']) {
      BasketProduct basketProduct = result['basketProduct'];
      emit(IntialProduct(basketProduct));
    } else {
      emit(const Error());
    }
  }

  Future<void> addAmountBasketProduct(
      int userId, String productId, int amount, String page) async {
    await _basketRepository.addAmountBasketProduct(userId, productId, amount);
    if (page == 'product') {
      Map result = await _basketRepository.getProductBasket(userId, productId);
      if (result['result']) {
        BasketProduct basketProduct = result['basketProduct'];
        emit(IntialProduct(basketProduct));
      } else {
        emit(const Error());
      }
    } else {
      Map result = await _basketRepository.getBasket(userId);
      if (result['result']) {
        List<BasketProduct> basketProducts = result['basketProducts'];
        emit(Intial(basketProducts));
      } else {
        emit(const Error());
      }
    }
  }

  Future<void> minusAmountBasketProduct(
      int userId, String productId, int amount, String page) async {
    await _basketRepository.minusAmountBasketProduct(userId, productId, amount);
    if (page == 'product') {
      Map result = await _basketRepository.getProductBasket(userId, productId);
      if (result['result']) {
        BasketProduct basketProduct = result['basketProduct'];
        emit(IntialProduct(basketProduct));
      } else {
        emit(const Error());
      }
    } else {
      Map result = await _basketRepository.getBasket(userId);
      if (result['result']) {
        List<BasketProduct> basketProducts = result['basketProducts'];
        emit(Intial(basketProducts));
      } else {
        emit(const Error());
      }
    }
  }

  Future<void> remuveProductBasket(
      int userId, String productId, String page) async {
    await _basketRepository.remuveProductBasket(userId, productId);
    if (page == 'product') {
      Map result = await _basketRepository.getProductBasket(userId, productId);
      if (result['result']) {
        BasketProduct basketProduct = result['basketProduct'];
        emit(IntialProduct(basketProduct));
      } else {
        emit(const Error());
      }
    } else {
      Map result = await _basketRepository.getBasket(userId);
      if (result['result']) {
        List<BasketProduct> basketProducts = result['basketProducts'];
        emit(Intial(basketProducts));
      } else {
        emit(const Error());
      }
    }
  }
}
