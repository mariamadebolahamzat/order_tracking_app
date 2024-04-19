import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:order_tracking_app/src/domain/order/enums/status_enum.dart';
import 'package:order_tracking_app/src/services/ably_service.dart';

import '../../domain/order/dtos/order_detail.dart';

class OrderNotifier extends AutoDisposeStreamNotifier<StatusEnum> {
  final AblyService ablyService = AblyService();

  final order = OrderDetail(
    id: '4563890',
    date: DateTime.now(),
    item: "Burger and Chicken Wrap",
    quantity: 4,
    place: 'Mae\'s Kitchen',
    price: 7000,
  );

  void init() {
    ablyService.initListeners();
  }

  void dispose() {
    ablyService.dispose();
  }

  @override
  Stream<StatusEnum> build() {
    return ablyService.orderSC.stream;
  }
}

final orderNotifier = StreamNotifierProvider.autoDispose<OrderNotifier, StatusEnum>(
  () => OrderNotifier(),
);
