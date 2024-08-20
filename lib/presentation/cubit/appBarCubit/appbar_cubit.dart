import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopsocks/domain/repository/basket_repository.dart';
import 'package:shopsocks/domain/repository/favorite_repository.dart';

part 'appbar_cubit.freezed.dart';

part 'appbar_state.dart';

class AppBarCubit extends Cubit<AppBarState> {
  final BasketRepository _basketRepository = BasketRepository();
  final FavoriteRepository _favoriteRepository = FavoriteRepository();

  AppBarCubit() : super(const Loading());

  Future<bool> initialAppBar(int userId) async {
    emit(Loading());
    Map result = await _basketRepository.isEmpty(userId);
    Map result2 = await _favoriteRepository.isEmpty(userId);
    if (result['result'] && result2['result']) {
      bool basketIsEmpty = result['basketIsEmpty'];
      bool favoriteIsEmpty = result2['favoriteIsEmpty'];
      emit(Intial(basketIsEmpty, favoriteIsEmpty));
      return true;
    } else {
      emit(const Error());
      return false;
    }
  }
}
