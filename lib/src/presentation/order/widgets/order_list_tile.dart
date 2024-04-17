import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:order_tracking_app/src/shared/constants/sizing_extension.dart';

class OrderListTile extends StatelessWidget {
  const OrderListTile({super.key});

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
                borderRadius: BorderRadius.circular(8.rsp), color: Colors.orange[300]),
          ),
          12.horizontalSpace,
          Flexible(
            child: Text('Sweet Chilli Chicken Wrap ',
                maxLines: 2,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.black, fontWeight: FontWeight.w700)),
          ),
          Container(
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20.rsp),
            ),
            child: Text('1x',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.white, fontWeight: FontWeight.w700)),
          ),
          30.horizontalSpace,
          Text('9000',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}
