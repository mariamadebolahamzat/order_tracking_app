import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:order_tracking_app/src/presentation/order/widgets/order_list_tile.dart';
import 'package:order_tracking_app/src/presentation/order/widgets/order_tracking_bottomsheet.dart';
import 'package:order_tracking_app/src/shared/constants/sizing_extension.dart';

class OrderDetails extends StatelessWidget {
  final User user;
  static const route = '/order-details';
  const OrderDetails({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
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
                image: DecorationImage(image: NetworkImage(user.photoURL ?? ''))),
          ),
          4.horizontalSpace,
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(
              user.displayName ?? '',
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
                  'ORDER ID: 4563890',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              16.verticalSpace,
              Text(
                'From: Koila Bistro',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              8.verticalSpace,
              Row(
                children: [
                  Text('Fri, June 30, 2023',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black)),
                  Text(' | ',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.orange[300])),
                  Text('5 mins ago',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.black,
                          )),
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
                    const OrderListTile(),
                    const OrderListTile(),
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
                          Text('Total Amount',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.w700)),
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
                          88.horizontalSpace,
                          Text('18000',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              40.verticalSpace,
              Container(
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
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return const OrderTrackingBottomSheet();
                            });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
