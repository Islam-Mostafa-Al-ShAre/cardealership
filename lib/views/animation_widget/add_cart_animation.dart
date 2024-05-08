import 'package:cardealership/utils/constants/colors.dart';
import 'package:cardealership/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddToCartAnimationWidget extends StatelessWidget {
  AddToCartAnimationWidget({
    super.key,
    required this.controller,
  });

  var controller;

  @override
  Widget build(BuildContext context) {
    bool isDark = THelperFunctions.isDarkMode(context);
    return AnimatedBuilder(
      animation: controller.addToCartAnimationController,
      builder: (context, child) {
        return Positioned(
            right: 120 - (120 * (controller.animation.value as double)),
            top: 400 - (400 * (controller.animation.value as double)),
            child: Text(
              controller.addToCartAimationText,
              style: TextStyle(
                  color: isDark ? TColors.primary : TColors.secondary,
                  fontSize: controller.animation.value == 0
                      ? 0
                      : (1 - controller.animation.value) * 150),
            ));
      },
    );
  }
}
