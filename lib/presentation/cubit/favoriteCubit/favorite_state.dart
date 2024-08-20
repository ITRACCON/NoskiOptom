part of 'favorite_cubit.dart';

@freezed
abstract class FavoriteState with _$FavoriteState {
  const factory FavoriteState.initial(List<FavoriteProduct> favoriteProduct) =
      Intial;
  const factory FavoriteState.loading() = Loading;

  const factory FavoriteState.error() = Error;
}
