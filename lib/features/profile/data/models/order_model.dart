import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  final num amount;
  final String currency;
  final String status;
  final Timestamp created_at;
  final String order_id;

  OrderModel(
      {required this.amount,
      required this.currency,
      required this.status,
      required this.created_at,
      required this.order_id});
  factory OrderModel.fromJson(json) {
    return OrderModel(
      amount: json['amount'],
      currency: json['currency'],
      status: json['status'],
      created_at: json['created_at'],
      order_id: json['order_id'],
    );
  }
}
