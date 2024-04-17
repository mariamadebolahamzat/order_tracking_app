import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:order_tracking_app/src/presentation/auth/auth_button.dart';
import 'package:order_tracking_app/src/shared/constants/assets_extension.dart';

class AuthView extends StatelessWidget {
  static const route = '/auth-view';
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Stack(
        children: [
          ClipPath(
            clipBehavior: Clip.antiAlias,
            clipper: CustomClipPath(),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              color: Colors.orange[300],
              height: MediaQuery.of(context).size.height * 0.85,
            ),
          ),
          Positioned(
            top: 100,
            left: 50,
            right: 50,
            bottom: 100,
            child: Image.asset(
              'food'.png,
              width: 50,
              height: 50,
            ),
          ),
          48.verticalSpace,
          Positioned(
            top: 420,
            left: 20,
            right: 20,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  60.verticalSpace,
                  Text('CREATE YOUR ACCOUNT',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: Colors.orange[300], fontWeight: FontWeight.bold)),
                  40.verticalSpace,
                  AuthButton(
                    onTap: () {},
                    buttonText: 'Sign in with Google',
                    image: 'google_logo'.svg,
                  ),
                  20.verticalSpace,
                  AuthButton(
                    onTap: () {},
                    buttonText: 'Sign in with GitHub',
                    image: 'github_logo'.svg,
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
    path.lineTo(0, size.height * 0.5);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.7,
      size.width * 0.5,
      size.height * 0.5,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.3,
      size.width,
      size.height * 0.5,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
