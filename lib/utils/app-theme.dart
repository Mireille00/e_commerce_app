import 'package:e_commerce_app/utils/my-colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData MyTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor,
        ),
        titleMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: AppColors.whiteColor,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: AppColors.whiteColor,
        )),
  );
}
