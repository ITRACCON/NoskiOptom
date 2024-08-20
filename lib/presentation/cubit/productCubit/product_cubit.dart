import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopsocks/domain/repository/basket_repository.dart';
import 'package:shopsocks/domain/repository/favorite_repository.dart';
import 'package:shopsocks/domain/models/basket_model.dart';
import 'package:shopsocks/domain/models/favorite_product.dart';

part 'product_cubit.freezed.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final BasketRepository _basketRepository = BasketRepository();
  final FavoriteRepository _favoriteRepository = FavoriteRepository();

  ProductCubit() : super(const Loading());

  Future<void> getProduct(int userId, String productId) async {
    Map result = await _basketRepository.getProductBasket(userId, productId);
    Map result2 =
        await _favoriteRepository.getProductFavorite(userId, productId);

    if (result['result'] && result2['result']) {
      BasketProduct basketProduct = result['basketProduct'];
      FavoriteProduct favoriteProduct = result2['favoriteProduct'];
      emit(IntialProduct(basketProduct, favoriteProduct));
    } else {
      emit(Error());
    }
  }

  Future<void> addProductBasket(int userId, String productId, int amount,
      String userName, String userFL) async {
    await _basketRepository.addProductBasket(
        userId, productId, amount, userName, userFL);
    Map result = await _basketRepository.getProductBasket(userId, productId);
    Map result2 =
        await _favoriteRepository.getProductFavorite(userId, productId);

    if (result['result'] && result2['result']) {
      BasketProduct basketProduct = result['basketProduct'];
      FavoriteProduct favoriteProduct = result2['favoriteProduct'];
      emit(IntialProduct(basketProduct, favoriteProduct));
    } else {
      emit(Error());
    }
  }

  Future<void> addAmountBasketProduct(
      int userId, String productId, int amount) async {
    await _basketRepository.addAmountBasketProduct(userId, productId, amount);

    Map result = await _basketRepository.getProductBasket(userId, productId);
    Map result2 =
        await _favoriteRepository.getProductFavorite(userId, productId);

    if (result['result'] && result2['result']) {
      BasketProduct basketProduct = result['basketProduct'];
      FavoriteProduct favoriteProduct = result2['favoriteProduct'];
      emit(IntialProduct(basketProduct, favoriteProduct));
    } else {
      emit(Error());
    }
  }

  Future<void> minusAmountBasketProduct(
      int userId, String productId, int amount) async {
    await _basketRepository.minusAmountBasketProduct(userId, productId, amount);

    Map result = await _basketRepository.getProductBasket(userId, productId);
    Map result2 =
        await _favoriteRepository.getProductFavorite(userId, productId);

    if (result['result'] && result2['result']) {
      BasketProduct basketProduct = result['basketProduct'];
      FavoriteProduct favoriteProduct = result2['favoriteProduct'];
      emit(IntialProduct(basketProduct, favoriteProduct));
    } else {
      emit(Error());
    }
  }

  Future<void> remuveProductBasket(int userId, String productId) async {
    await _basketRepository.remuveProductBasket(userId, productId);

    Map result = await _basketRepository.getProductBasket(userId, productId);
    Map result2 =
        await _favoriteRepository.getProductFavorite(userId, productId);

    if (result['result'] && result2['result']) {
      BasketProduct basketProduct = result['basketProduct'];
      FavoriteProduct favoriteProduct = result2['favoriteProduct'];
      emit(IntialProduct(basketProduct, favoriteProduct));
    } else {
      emit(Error());
    }
  }

  Future<void> addProductFavorite(int userId, String productId) async {
    await _favoriteRepository.addProductFavorite(userId, productId);
    Map result = await _basketRepository.getProductBasket(userId, productId);
    Map result2 =
        await _favoriteRepository.getProductFavorite(userId, productId);

    if (result['result'] && result2['result']) {
      BasketProduct basketProduct = result['basketProduct'];
      FavoriteProduct favoriteProduct = result2['favoriteProduct'];
      emit(IntialProduct(basketProduct, favoriteProduct));
    } else {
      emit(Error());
    }
  }

  Future<void> remuveProductFavorite(int userId, String productId) async {
    await _favoriteRepository.remuveProductFavorite(userId, productId);

    Map result = await _basketRepository.getProductBasket(userId, productId);
    Map result2 =
        await _favoriteRepository.getProductFavorite(userId, productId);

    if (result['result'] && result2['result']) {
      BasketProduct basketProduct = result['basketProduct'];
      FavoriteProduct favoriteProduct = result2['favoriteProduct'];
      emit(IntialProduct(basketProduct, favoriteProduct));
    } else {
      emit(Error());
    }
  }
}
