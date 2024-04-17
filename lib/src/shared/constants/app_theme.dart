import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_tracking_app/src/shared/constants/app_textstyles.dart';
import 'package:order_tracking_app/src/shared/constants/sizing_extension.dart';

class AppTheme {
  final BuildContext context;

  const AppTheme(this.context);

  ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        colorScheme: _lightColorScheme,
        scaffoldBackgroundColor: _lightColorScheme.surface,
        appBarTheme: AppBarTheme(
          scrolledUnderElevation: 0.0,
          elevation: 0,
          backgroundColor: _lightColorScheme.surface,
          iconTheme: IconThemeData(
            color: Colors.black,
            size: 24.rw,
          ),
          titleTextStyle: AppTextStyles.medium2.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        textTheme: GoogleFonts.karlaTextTheme(_textTheme),
      );

  ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        colorScheme: _darkColorScheme,
        scaffoldBackgroundColor: _darkColorScheme.surface,
        appBarTheme: AppBarTheme(
          scrolledUnderElevation: 0.0,
          elevation: 0,
          backgroundColor: _darkColorScheme.surface,
          iconTheme: IconThemeData(
            color: Colors.black,
            size: 24.rw,
          ),
          titleTextStyle: AppTextStyles.medium2.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        textTheme: GoogleFonts.karlaTextTheme(_textTheme),
      );

  TextTheme get _textTheme => Theme.of(context).textTheme.copyWith(
        headlineLarge: AppTextStyles.xxLarge,
        headlineMedium: AppTextStyles.xLarge,
        headlineSmall: AppTextStyles.large,
        bodyLarge: AppTextStyles.medium1,
        bodyMedium: AppTextStyles.medium2,
        bodySmall: AppTextStyles.medium3,
        labelLarge: AppTextStyles.small1,
        labelMedium: AppTextStyles.small2,
      );

  ColorScheme get _lightColorScheme => ColorScheme.fromSwatch().copyWith(
        primary: Colors.pink,
        secondary: Colors.yellow,
        surface: Colors.grey,
        onSurface: Colors.white,
        onSurfaceVariant: Colors.grey[400],
        onBackground: Colors.black,
        onSecondary: Colors.blue,
      );

  ColorScheme get _darkColorScheme => ColorScheme.fromSwatch().copyWith(
        primary: Colors.pink,
        secondary: Colors.yellow,
        surface: Colors.grey,
        onSurface: Colors.white,
        onSurfaceVariant: Colors.grey[400],
        onBackground: Colors.black,
        onSecondary: Colors.blue,
      );
}
