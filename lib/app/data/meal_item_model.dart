import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'food_item_model.dart';

class MealItem {
  final String mealName;
  final IconData iconData;
  final RxList<FoodItem> listOfFoodItems;
  final RxInt totalCalories;
  final RxBool isEditState;

  const MealItem({
    required this.mealName,
    required this.iconData,
    required this.listOfFoodItems,
    required this.totalCalories,
    required this.isEditState,
  });
}
