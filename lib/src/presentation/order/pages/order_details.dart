import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:order_tracking_app/src/application/order/order_notifier.dart';
import 'package:order_tracking_app/src/presentation/order/widgets/order_list_tile.dart';
import 'package:order_tracking_app/src/shared/constants/sizing_extension.dart';

import '../widgets/track_order_tile.dart';

class OrderDetails extends ConsumerStatefulWidget {
  final User user;
  static const route = '/order-details';
  const OrderDetails({super.key, required this.user});

  @override
  ConsumerState<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends ConsumerState<OrderDetails> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.watch(orderNotifier.notifier).init();
    });
  }

  @override
  void dispose() {
    super.dispose();
    ref.watch(orderNotifier.notifier).dispose();
  }

  @override
  Widget build(BuildContext context) {
    final order = ref.watch(orderNotifier.notifier).order;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back,
        ),
        title: Text('Order Detail',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
        actions: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 5, color: Colors.white),
                image: DecorationImage(image: NetworkImage(widget.user.photoURL ?? ''))),
          ),
          4.horizontalSpace,
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(
              widget.user.displayName ?? '',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20.0.rw, top: 20.rh, right: 20.0.rw),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.orange, width: 1),
                ),
                child: Text(
                  'ORDER ID: ${order.id}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              16.verticalSpace,
              Text(
                'From: ${order.place}',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              8.verticalSpace,
              Row(
                children: [
                  Text(order.parsedDate,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black)),
                  Text(' | ',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.orange[300])),
                  Text(
                    '${DateTime.now().difference(order.date).inMinutes} mins ago',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.black,
                        ),
                  ),
                ],
              ),
              24.verticalSpace,
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange, width: 0.5),
                  borderRadius: BorderRadius.circular(12.rsp),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text('YOUR ORDER',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey)),
                    ),
                    OrderListTile(order: order),
                    12.verticalSpace,
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.orange[200],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12.rsp),
                            bottomRight: Radius.circular(12.rsp),
                          )),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Text('Total Amount',
                                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                        color: Colors.black, fontWeight: FontWeight.w700)),
                                8.horizontalSpace,
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.rsp),
                                  ),
                                  child: Text('Paid',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(color: Colors.black)),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '₦ ${order.totalPrice.toInt()}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: Colors.black, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              40.verticalSpace,
              const TrackOrderTile(),
            ],
          ),
        ),
      ),
    );
  }
}
