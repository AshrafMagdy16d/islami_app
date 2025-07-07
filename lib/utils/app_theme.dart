import 'package:flutter/material.dart';
import 'package:islamy/utils/app_colors.dart';
import 'package:islamy/utils/app_styles.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.transparentColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.blackColor,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.blackBgColor,
      titleTextStyle: AppStyles.bold20Primary,
      iconTheme: IconThemeData(color: AppColors.primaryColor),
    ),
  );
}
