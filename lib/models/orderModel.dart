import 'package:intl/intl.dart';

class OrderModel {
  String id;
  double amount;
  String paymentMethod;
  String fullname;
  String phone;
  String email;
  List items;
  int timestamp;

  OrderModel(
      {required this.id,
      required this.amount,
      required this.paymentMethod,
      required this.fullname,
      required this.phone,
      required this.email,
      required this.items,
      this.timestamp = 0});

  Map<String, dynamic> toJson() {
    var json = {
      'id': id,
      'fullname': fullname,
      'amount': amount,
      'phone': phone,
      'email': email,
      'paymentMethod': paymentMethod,
      'items': items,
      'timestamp': getTimestamp()
    };
    return json;
  }

  getTimestamp() {
    final now = DateTime.now();
    int stamp = now.millisecondsSinceEpoch;
    timestamp = stamp;
    return stamp;
  }
}
