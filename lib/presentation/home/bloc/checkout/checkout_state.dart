part of 'checkout_bloc.dart';

@freezed
class CheckoutState with _$CheckoutState {
  const factory CheckoutState.initial() = _Initial;
  const factory CheckoutState.loading() = _Loading;
  const factory CheckoutState.success(List<OrderItem> products, int totalQuantity, int totalPrice ) = _Success;
  const factory CheckoutState.error(String message) = _Error;
}
