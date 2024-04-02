import 'package:calorie_counter/core/theme/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../widgets/meal_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Meals',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.more_horiz,
                  )
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: Get.height * 0.8,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.listOfMealItems.length,
                  itemBuilder: (context, index) {
                    return MealWidget(
                      mealItem: controller.listOfMealItems[index],
                      controller: controller,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
