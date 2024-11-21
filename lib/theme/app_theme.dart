import 'app_colors.dart';
import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.scaffoldColor,
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.appBarColor,
    foregroundColor: Colors.white,
  ),
);
