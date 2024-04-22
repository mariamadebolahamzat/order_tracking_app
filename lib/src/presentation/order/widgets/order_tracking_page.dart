import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:order_tracking_app/src/domain/order/enums/status_enum.dart';
import 'package:timelines/timelines.dart';

import '../../../application/order/order_notifier.dart';

class OrderTrackingPage extends ConsumerWidget {
  static const route = '/order-tracking';
  const OrderTrackingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).textTheme;
    final order = ref.watch(orderNotifier.notifier).order;
    final status = ref.watch(orderNotifier).value ?? order.parsedStatus;
    final trackingSteps = [
      TrackingStep(
        status: StatusEnum.placed,
        title: 'Preparing Your Order',
        description: 'Your order will be ready in 10 minutes',
        time: '1:01pm',
      ),
      TrackingStep(
        status: StatusEnum.accepted,
        title: 'Rider Accepted Order',
        description: 'Your order has been assigned to a rider.',
        time: '1:06pm',
      ),
      TrackingStep(
        status: StatusEnum.pickUp,
        title: 'Rider At The Vendor',
        description: 'Rider is waiting to pick up your order',
        time: '1:08pm',
      ),
      TrackingStep(
        status: StatusEnum.roadToCustomer,
        title: 'Rider Picked Up Order',
        description: 'Your order is on its way.',
        time: '1:41pm',
      ),
      TrackingStep(
        status: StatusEnum.arrived,
        title: 'Order Arrived',
        description: 'Your driver is around to deliver your order.',
        time: '2:25pm',
      ),
      TrackingStep(
        status: StatusEnum.delivered,
        title: 'Order Delivered',
        description: 'Your order has been delivered',
        time: '2:29pm',
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text('Order #${order.id} Timeline',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Timeline.tileBuilder(
                shrinkWrap: true,
                builder: TimelineTileBuilder.connectedFromStyle(
                  itemCount: trackingSteps.length,
                  connectorStyleBuilder: (context, index) => ConnectorStyle.solidLine,
                  indicatorStyleBuilder: (context, index) {
                    if (status.index >= trackingSteps[index].status.index) {
                      return IndicatorStyle.dot;
                    }
                    return IndicatorStyle.outlined;
                  },
                  contentsBuilder: (context, index) {
                    return TrackItemWidget(step: trackingSteps[index]);
                  },
                ),
                theme: TimelineThemeData(
                  nodePosition: 0.04,
                  indicatorTheme: const IndicatorThemeData(
                    position: 0.3,
                    size: 20.0,
                    color: Colors.black,
                  ),
                  connectorTheme: const ConnectorThemeData(
                    thickness: 2.5,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TrackingStep {
  final StatusEnum status;
  final String title;
  final String description;
  final String time;

  TrackingStep({
    required this.status,
    required this.title,
    required this.description,
    required this.time,
  });
}

class TrackItemWidget extends StatelessWidget {
  final TrackingStep step;
  const TrackItemWidget({
    super.key,
    required this.step,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    step.title,
                    style: theme.bodyLarge?.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  step.description,
                  style: theme.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          // Text(
          //   step.time,
          //   style: TextStyle(
          //     fontSize: 14.0,
          //     fontWeight: FontWeight.bold,
          //     color: Colors.grey,
          //   ),
          // ),
        ],
      ),
    );
  }
}
