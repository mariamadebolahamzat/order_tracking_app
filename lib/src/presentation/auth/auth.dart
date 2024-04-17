import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AuthView extends StatelessWidget {
  static const route = '/auth-view';
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(
            top: 300,
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [],
            ),
          ),
          ClipPath(
            clipBehavior: Clip.antiAlias,
            clipper: CustomClipPath(),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              color: Colors.orange,
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  SafeArea(
                    bottom: false,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        32.horizontalSpace,
                        SvgPicture.asset(''),
                        Padding(
                          padding: const EdgeInsets.only(right: 24),
                          child:
                              Align(alignment: Alignment.centerLeft, child: SvgPicture.asset('')),
                        ),
                      ],
                    ),
                  ),
                  48.verticalSpace,
                  const Text(
                    'Math made\neasy to learn',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height * 0.35);
    path.quadraticBezierTo(
      size.width / 2,
      size.height / 2,
      size.width,
      size.height * 0.35,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
