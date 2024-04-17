import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:order_tracking_app/src/presentation/order/pages/order_details.dart';
import 'package:order_tracking_app/src/shared/constants/app_theme.dart';
import 'package:order_tracking_app/src/shared/router/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  static const _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          title: 'Order Tracking App',
          debugShowCheckedModeBanner: false,
          navigatorKey: AppRouter.navKey,
          onGenerateRoute: _appRouter.generateRoutes,
          initialRoute: OrderDetails.route,
          theme: AppTheme(context).lightTheme,
          darkTheme: AppTheme(context).darkTheme,
        ),
      ),
    );
  }
}
