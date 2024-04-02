import 'package:calorie_counter/core/theme/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: AppColors.primary,
        primaryColorDark: AppColors.secondary,
        primaryColorLight: AppColors.lightBrown,
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            color: AppColors.secondary,
          ),
        ),
      ),
    ),
  );
}
