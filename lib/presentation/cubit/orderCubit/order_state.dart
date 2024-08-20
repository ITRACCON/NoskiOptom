part of 'order_cubit.dart';

@freezed
abstract class OrderState with _$OrderState {
  const factory OrderState.init() = Initial;
  const factory OrderState.placingOrderSuccess() = Success;

  const factory OrderState.placingOrderLoading() = Loading;

  const factory OrderState.placingOrderError() = Error;
}
