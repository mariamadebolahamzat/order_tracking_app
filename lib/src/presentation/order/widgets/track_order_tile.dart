import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:order_tracking_app/src/domain/order/enums/status_enum.dart';
import 'package:order_tracking_app/src/shared/constants/sizing_extension.dart';

import '../../../application/order/order_notifier.dart';
import 'order_tracking_page.dart';

class TrackOrderTile extends ConsumerWidget {
  const TrackOrderTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final order = ref.watch(orderNotifier.notifier).order;
    final status = ref.watch(orderNotifier).value ?? order.parsedStatus;

    return Container(
      padding: EdgeInsets.all(20.rsp),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(12.rsp),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Your order has been placed',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.w700)),
          12.verticalSpace,
          Text('Waiting for the vendor to accept your order.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey,
                  )),
          20.verticalSpace,
          Row(
            children: StatusEnum.values.map((e) {
              return Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  height: 4,
                  color: status.index >= e.index ? Colors.green.shade400 : Colors.grey.shade200,
                ),
              );
            }).toList(),
          ),
          20.verticalSpace,
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, OrderTrackingPage.route);
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade200,
                borderRadius: BorderRadius.circular(16.rsp),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Track Order Status',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: Colors.black, fontWeight: FontWeight.w700)),
                  const Icon(Icons.keyboard_arrow_down),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
