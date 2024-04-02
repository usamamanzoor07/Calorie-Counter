import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/colors.dart';
import '../../../data/food_item_model.dart';

class FoodItemWidget extends StatelessWidget {
  const FoodItemWidget({
    super.key,
    required this.index,
    required this.foodItem,
    required this.isEditState,
    required this.onTap,
  });
  final int index;
  final FoodItem foodItem;
  final RxBool isEditState;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: index == 0
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    )
                  : null),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                foodItem.foodName,
                style: const TextStyle(color: AppColors.lightBrown),
              ),
              SizedBox(
                width: 90,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${foodItem.calories} Cals'),
                      Obx(() {
                        return isEditState.value
                            ? InkWell(
                                onTap: onTap,
                                child: const Icon(Icons.cancel,
                                    color: AppColors.red))
                            : const Icon(Icons.arrow_circle_right);
                      }),
                    ]),
              )
            ],
          ),
        ),
        const Divider(
          color: AppColors.white,
          indent: 16,
          height: 0,
          endIndent: 16,
        ),
      ],
    );
  }
}
