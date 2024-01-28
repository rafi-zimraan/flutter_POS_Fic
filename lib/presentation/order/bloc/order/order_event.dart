part of 'order_bloc.dart';

@freezed
class OrderEvent with _$OrderEvent {
  const factory OrderEvent.started() = _Started;
  const factory OrderEvent.addPaymentMethod(String paymentMethod, List<OrderItem> orders) = _AddPaymentMethod;
  const factory OrderEvent.addNominalBayar(int nominal) = _AddNominalBayar;


}