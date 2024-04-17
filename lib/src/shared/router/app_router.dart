import 'package:flutter/material.dart';
import 'package:order_tracking_app/src/presentation/auth/auth.dart';
import 'package:order_tracking_app/src/presentation/splash.dart';

class AppRouter {
  const AppRouter();

  static final navKey = GlobalKey<NavigatorState>();

  Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case SplashView.route:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case AuthView.route:
        return MaterialPageRoute(builder: (_) => const AuthView());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'No Route defined for ${settings.name}',
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ),
        );
    }
  }
}
