part of 'product_cubit.dart';

@freezed
abstract class ProductState with _$ProductState {
  const factory ProductState.initialProduct(
          BasketProduct basketProducts, FavoriteProduct favoriteProduct) =
      IntialProduct;

  const factory ProductState.loading() = Loading;

  const factory ProductState.error() = Error;
}
