part of 'products_cubit.dart';

@freezed
abstract class ProductsState with _$ProductsState {
  const factory ProductsState.initial(List<Product> products, int page, String typePage) = Intial;

  const factory ProductsState.loading() = Loading;

  const factory ProductsState.error() = Error;
}
