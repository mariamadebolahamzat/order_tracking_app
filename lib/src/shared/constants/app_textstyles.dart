import 'package:flutter/material.dart';
import 'package:order_tracking_app/src/shared/constants/sizing_extension.dart';

abstract class AppTextStyles {
  const AppTextStyles();

  static const _roboto = 'Roboto';

  static TextStyle xxLarge = xLarge.copyWith(
    fontSize: 26.rsp,
    fontFamily: _roboto,
  );

  static TextStyle xLarge = TextStyle(
    fontSize: 24.rsp,
    fontWeight: FontWeight.w500,
    height: 1.169,
    leadingDistribution: TextLeadingDistribution.even,
    letterSpacing: 0.5,
    fontFamily: _roboto,
  );

  static TextStyle large = xLarge.copyWith(
    fontSize: 20.rsp,
    fontFamily: _roboto,
  );

  static TextStyle medium1 = xLarge.copyWith(
    fontSize: 16.rsp,
    fontFamily: _roboto,
  );

  static TextStyle medium2 = xLarge.copyWith(
    fontSize: 14.rsp,
    fontWeight: FontWeight.w400,
    fontFamily: _roboto,
  );

  static TextStyle medium3 = xLarge.copyWith(
    fontFamily: _roboto,
    fontSize: 13.rsp,
  );

  static TextStyle small1 = xLarge.copyWith(
    fontSize: 12.rsp,
    fontWeight: FontWeight.w400,
    fontFamily: _roboto,
  );

  static TextStyle small2 = xLarge.copyWith(
    fontSize: 11.rsp,
    fontFamily: _roboto,
  );
}
