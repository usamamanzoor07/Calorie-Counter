import 'dart:math';

import 'package:calorie_counter/app/data/food_item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/meal_item_model.dart';

class HomeController extends GetxController {
  List<MealItem> listOfMealItems = [
    MealItem(
      mealName: 'Meal One',
      iconData: Icons.lunch_dining,
      listOfFoodItems: <FoodItem>[].obs,
      totalCalories: 0.obs,
      isEditState: false.obs,
    ),
    MealItem(
      mealName: 'Meal Two',
      iconData: Icons.ramen_dining,
      listOfFoodItems: <FoodItem>[].obs,
      totalCalories: 0.obs,
      isEditState: false.obs,
    ),
    MealItem(
      mealName: 'Meal Three',
      iconData: Icons.dining,
      listOfFoodItems: <FoodItem>[].obs,
      totalCalories: 0.obs,
      isEditState: false.obs,
    ),
    MealItem(
      mealName: 'Meal Four',
      iconData: Icons.bakery_dining,
      listOfFoodItems: <FoodItem>[].obs,
      totalCalories: 0.obs,
      isEditState: false.obs,
    ),
    MealItem(
      mealName: 'Meal Five',
      iconData: Icons.dinner_dining,
      listOfFoodItems: <FoodItem>[].obs,
      totalCalories: 0.obs,
      isEditState: false.obs,
    ),
    MealItem(
      mealName: 'Meal Six',
      iconData: Icons.brunch_dining,
      listOfFoodItems: <FoodItem>[].obs,
      totalCalories: 0.obs,
      isEditState: false.obs,
    ),
  ];

  List<FoodItem> sampleFoodItems = [
    const FoodItem(
      foodName: 'Chicken Breast (3 oz)',
      calories: 165,
    ),
    const FoodItem(
      foodName: 'Brown Rice (1 cup, cooked)',
      calories: 216,
    ),
    const FoodItem(foodName: 'Broccoli (1 cup)', calories: 34),
    const FoodItem(foodName: 'Banana (1 medium)', calories: 105),
    const FoodItem(foodName: 'Eggs (2 large)', calories: 140),
    const FoodItem(foodName: 'Whole-wheat bread (1 slice)', calories: 75),
    const FoodItem(foodName: 'Oatmeal (1 cup, cooked)', calories: 150),
    const FoodItem(foodName: 'Milk (1 cup, low-fat)', calories: 102),
    const FoodItem(foodName: 'Apple (1 medium)', calories: 95),
    const FoodItem(foodName: 'Salmon (3 oz, cooked)', calories: 206),
  ];

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  int calculateCalories(List<FoodItem> listOfFoodItems) {
    int totalCalories = 0;
    for (var element in listOfFoodItems) {
      totalCalories = totalCalories + element.calories;
    }
    return totalCalories;
  }

  MealItem addFoodItem(MealItem mealItem) {
    if (mealItem.listOfFoodItems.length != sampleFoodItems.length) {
      final random = Random();
      final index = random.nextInt(sampleFoodItems.length);
      mealItem.listOfFoodItems.add(sampleFoodItems.elementAt(index));
    } else {}
    mealItem.totalCalories.value = calculateCalories(mealItem.listOfFoodItems);
    mealItem.isEditState.value = false;
    return mealItem;
  }

  MealItem removeFoodItem(MealItem mealItem, int index) {
    mealItem.listOfFoodItems.removeAt(index);
    mealItem.totalCalories.value = calculateCalories(mealItem.listOfFoodItems);
    return mealItem;
  }
}
