import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTextTheme {
  static const TextTheme textTheme = TextTheme(
    titleMedium: TextStyle(
      fontFamily: "Inter",
      color: AppColors.white1,
      fontSize: 14.0,
    ),
    titleSmall: TextStyle(
      fontFamily: "Lato",
      color: AppColors.white1,
      fontSize: 14.0,
    ),
  );
}
