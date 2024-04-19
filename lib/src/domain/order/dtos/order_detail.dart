import 'package:intl/intl.dart';

import '../enums/status_enum.dart';

class OrderDetail {
  final String id;
  final DateTime date;
  final String item;
  final int quantity;
  final double price;
  final String place;
  final String status;

  OrderDetail({
    required this.id,
    required this.date,
    required this.item,
    required this.quantity,
    required this.price,
    required this.place,
    this.status = "ORDER PLACED",
  });

  OrderDetail updateStatus(String status) {
    return OrderDetail(
      id: id,
      date: date,
      item: item,
      quantity: quantity,
      price: price,
      place: place,
      status: status,
    );
  }

  double get totalPrice => quantity * price;
  String get parsedDate => DateFormat.yMMMEd().format(date);
  StatusEnum get parsedStatus => StatusEnum.fromValue(status);
}
