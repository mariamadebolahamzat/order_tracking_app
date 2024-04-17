import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:order_tracking_app/src/shared/constants/sizing_extension.dart';

class AuthButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String buttonText;
  final String image;
  const AuthButton({super.key, this.onTap, required this.buttonText, required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.rsp),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              width: 30,
              height: 30,
            ),
            12.horizontalSpace,
            Text(
              buttonText,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
