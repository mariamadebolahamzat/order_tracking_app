import 'package:flutter/material.dart';
import 'package:order_tracking_app/src/presentation/auth/auth.dart';

class SplashView extends StatefulWidget {
  static const route = '/splash-view';
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _textAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _textAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });

    Future.delayed(const Duration(milliseconds: 5000), () {
      Navigator.of(context).pushReplacementNamed(AuthView.route);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  animation: _textAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: 1 + _textAnimation.value * 0.4,
                      child: child,
                    );
                  },
                  child: Text(
                    'ORTA',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Colors.orange[300],
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                AnimatedBuilder(
                  animation: _textAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: 1 + _textAnimation.value * 0.4,
                      child: child,
                    );
                  },
                  child: Text(
                    'Order Tracking App',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Colors.orange[300],
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
