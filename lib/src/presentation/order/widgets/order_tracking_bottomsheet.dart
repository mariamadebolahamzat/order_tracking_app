import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class OrderTrackingBottomSheet extends StatelessWidget {
  const OrderTrackingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Delivery Time',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          Expanded(
            child: Timeline.tileBuilder(
              builder: TimelineTileBuilder.connectedFromStyle(
                connectorStyleBuilder: (context, index) => ConnectorStyle.solidLine,
                indicatorStyleBuilder: (context, index) => IndicatorStyle.container,
                contentsBuilder: (context, index) {
                  return;
                },
                itemCount: 3,
              ),
              theme: TimelineThemeData(
                nodePosition: 0.2,
                color: Colors.green,
                indicatorTheme: const IndicatorThemeData(
                  position: 0.5,
                  size: 20.0,
                ),
                connectorTheme: const ConnectorThemeData(
                  thickness: 2.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TrackingStep {
  final String title;
  final String description;
  final String time;

  TrackingStep({
    required this.title,
    required this.description,
    required this.time,
  });
}

class TrackItemWidget extends StatelessWidget {
  const TrackItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final trackingSteps = [
      TrackingStep(
        title: 'Preparing Your Order',
        description: 'Your order will be ready in 10 minutes',
        time: '1:01pm',
      ),
      TrackingStep(
        title: 'Rider Accepted Order',
        description: 'Your order has been assigned to a rider.',
        time: '1:06pm',
      ),
      TrackingStep(
        title: 'Rider At The Vendor',
        description: 'Rider is waiting to pick up your order',
        time: '1:08pm',
      ),
      TrackingStep(
        title: 'Rider Picked Up Order',
        description: 'Your order is on its way.',
        time: '1:41pm',
      ),
      TrackingStep(
        title: 'Order Arrived',
        description: 'Your driver is around to deliver your order.',
        time: '2:25pm',
      ),
      TrackingStep(
        title: 'Order Delivered',
        description: 'Your order has been delivered',
        time: '2:29pm',
      ),
    ];

    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Expanded(
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    '',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(height: 4.0),
                Flexible(
                  child: Text(
                    'step.description',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              ' step.time',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
