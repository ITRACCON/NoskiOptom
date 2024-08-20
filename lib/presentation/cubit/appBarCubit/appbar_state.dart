part of 'appbar_cubit.dart';

@freezed
abstract class AppBarState with _$AppBarState {
  const factory AppBarState.initial(bool basketIsEmpty, bool favoriteIsEmpty) =  Intial;

  const factory AppBarState.loading() = Loading;

  const factory AppBarState.error() = Error;
}
