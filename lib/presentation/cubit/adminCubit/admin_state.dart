part of 'admin_cubit.dart';

@freezed
abstract class AdminState with _$AdminState {
  const factory AdminState.initialStats(
      List<User> users,
      List<OrderUser> orders,
      List<BasketProductStats> basketProductStat) = IntialStats;
  const factory AdminState.initial() = Intial;
  const factory AdminState.initialMassAdd(Map init) = initialMassAdd;
  const factory AdminState.success() = Success;
  const factory AdminState.initEditProduct(Product product) = InitEditProduct;

  const factory AdminState.loading() = Loading;

  const factory AdminState.error(String error) = Error;
}
