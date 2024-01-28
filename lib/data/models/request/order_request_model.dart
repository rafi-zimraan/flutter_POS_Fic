import 'dart:convert';

class OrderRequestModel {
  final String transactionTime;
  final int kasirId;
  final int totalPrice;
  final int totalItem;
  final String paymentMethod;
  final List<OrderItemModel> orderItems;

  OrderRequestModel({
    required this.transactionTime,
    required this.kasirId,
    required this.totalPrice,
    required this.totalItem,
    required this.orderItems,
    this.paymentMethod = 'cash',
  });

  factory OrderRequestModel.fromJson(String str) =>
      OrderRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderRequestModel.fromMap(Map<String, dynamic> json) =>
      OrderRequestModel(
        transactionTime: json["transaction_time"],
        kasirId: json["kasir_id"],
        totalPrice: json["total_price"],
        totalItem: json["total_item"],
        paymentMethod: json["payment_method"],
        orderItems: List<OrderItemModel>.from(
            json["order_items"].map((x) => OrderItemModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "transaction_time": transactionTime,
        "kasir_id": kasirId,
        "total_price": totalPrice,
        "total_item": totalItem,
        "payment_method": paymentMethod,
        "order_items": List<dynamic>.from(orderItems.map((x) => x.toMap())),
      };
}

class OrderItemModel {
  final int productId;
  final int quantity;
  final int totalPrice;

  OrderItemModel({
    required this.productId,
    required this.quantity,
    required this.totalPrice,
  });

  factory OrderItemModel.fromJson(String str) =>
      OrderItemModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderItemModel.fromMap(Map<String, dynamic> json) => OrderItemModel(
        productId: json["product_id"],
        quantity: json["quantity"],
        totalPrice: json["total_price"],
      );

  Map<String, dynamic> toMap() => {
        "product_id": productId,
        "quantity": quantity,
        "total_price": totalPrice,
      };
}
