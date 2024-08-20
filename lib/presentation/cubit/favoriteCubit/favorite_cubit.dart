import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopsocks/domain/repository/favorite_repository.dart';
import 'package:shopsocks/domain/models/favorite_product.dart';

part 'favorite_cubit.freezed.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepository _favoriteRepository = FavoriteRepository();

  FavoriteCubit() : super(const Loading());

  Future<void> initialFavorite(int userId) async {
    emit(Loading());
    Map result = await _favoriteRepository.getFavorite(userId);
    if (result['result']) {
      List<FavoriteProduct> favoriteProduct = result['favoriteProduct'];
      emit(Intial(favoriteProduct));
    } else {
      emit(Error());
    }
  }
}
