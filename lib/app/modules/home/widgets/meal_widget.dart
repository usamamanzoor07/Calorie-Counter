import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/colors.dart';
import '../../../data/meal_item_model.dart';
import '../controllers/home_controller.dart';
import 'food_item_widget.dart';

class MealWidget extends StatelessWidget {
  const MealWidget({
    super.key,
    required this.mealItem,
    required this.controller,
  });

  final MealItem mealItem;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          left: 8, right: 24, top: 8, bottom: 8),
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(
                        mealItem.iconData,
                        size: 30,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mealItem.mealName,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        (mealItem.listOfFoodItems.isEmpty)
                            ? Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                decoration: const ShapeDecoration(
                                    shape: StadiumBorder(),
                                    color: AppColors.lightBrown),
                                child: const Text(
                                  'No Products',
                                  style: TextStyle(color: AppColors.white),
                                ),
                              )
                            : mealItem.isEditState.value
                                ? InkWell(
                                    onTap: () {
                                      mealItem.isEditState.value =
                                          !mealItem.isEditState.value;
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: AppColors.green),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: const Text(
                                        'Save',
                                        style:
                                            TextStyle(color: AppColors.green),
                                      ),
                                    ),
                                  )
                                : Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          mealItem.isEditState.value =
                                              !mealItem.isEditState.value;
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1,
                                                color: AppColors.lightBrown),
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          child: const Text(
                                            'Edit',
                                            style: TextStyle(
                                                color: AppColors.lightBrown),
                                          ),
                                        ),
                                      ),
                                      const Icon(Icons.bookmark_outline)
                                    ],
                                  ),
                      ],
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                      ),
                      foregroundDecoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(4),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 4, bottom: 4),
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                            ),
                          ),
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () {
                              controller.addFoodItem(mealItem);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 18),
                              decoration: const BoxDecoration(
                                color: AppColors.secondary,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(24),
                                  bottomLeft: Radius.circular(16),
                                  bottomRight: Radius.circular(8),
                                  topLeft: Radius.circular(8),
                                ),
                              ),
                              alignment: Alignment.topRight,
                              child: const Icon(
                                Icons.add,
                                color: AppColors.white,
                                size: 32,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 10,
                          height: 4,
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                          ),
                          foregroundDecoration: const BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(4),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            if (mealItem.listOfFoodItems.isNotEmpty) ...[
              ListView.builder(
                itemCount: mealItem.listOfFoodItems.length + 1,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Obx(() {
                        return mealItem.listOfFoodItems.length + 1 != index + 1
                            ? FoodItemWidget(
                                foodItem: mealItem.listOfFoodItems[index],
                                index: index,
                                isEditState: mealItem.isEditState,
                                onTap: () {
                                  controller.removeFoodItem(mealItem, index);
                                },
                              )
                            : Container(
                                padding: const EdgeInsets.all(16),
                                margin: const EdgeInsets.only(bottom: 8),
                                decoration: const BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(16),
                                    bottomRight: Radius.circular(16),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Total',
                                      style: TextStyle(color: AppColors.green),
                                    ),
                                    SizedBox(
                                      width: 90,
                                      child: Text(
                                        '${mealItem.totalCalories} Cals',
                                        style: const TextStyle(
                                            color: AppColors.green),
                                      ),
                                    )
                                  ],
                                ),
                              );
                      }));
                },
              ),
            ],
          ],
        ),
      );
    });
  }
}
