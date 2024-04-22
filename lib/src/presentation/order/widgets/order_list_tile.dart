import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:order_tracking_app/src/domain/order/dtos/order_detail.dart';
import 'package:order_tracking_app/src/shared/constants/app_assets.dart';
import 'package:order_tracking_app/src/shared/constants/sizing_extension.dart';

class OrderListTile extends StatelessWidget {
  final OrderDetail order;
  const OrderListTile({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.rsp),
              color: Colors.green[300],
              image: const DecorationImage(
                image: NetworkImage(AppAssets.foodImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          12.horizontalSpace,
          Flexible(
            child: Text(order.item,
                maxLines: 2,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.black, fontWeight: FontWeight.w700)),
          ),
          12.horizontalSpace,
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20.rsp),
            ),
            child: Text('${order.quantity}x',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.white, fontWeight: FontWeight.w700)),
          ),
          24.horizontalSpace,
          Text(
            '₦ ${order.price.toInt()}',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
          ),
          12.horizontalSpace,
        ],
      ),
    );
  }
}
