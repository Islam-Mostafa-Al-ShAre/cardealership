import 'package:cardealership/controllers/cart_controller.dart';
import 'package:cardealership/controllers/home_controller.dart';

import 'package:cardealership/models/item.dart';
import 'package:cardealership/utils/constants/colors.dart';
import 'package:cardealership/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class HomeAddToCart extends StatelessWidget {
  HomeAddToCart({
    super.key,
    required this.item,
  });

  final CartController cartController = CartController.instance;
  final Item item;

  @override
  Widget build(BuildContext context) {
    bool isDark = THelperFunctions.isDarkMode(context);
    return GetBuilder<CartController>(
      builder: (controller) {
        return IconButton(
            onPressed: () {
              if (!cartController.isOnTheCart(item)) {
                cartController.addItem(item);
                HomeController.instance.startAnimation(true);
              } else {
                cartController.removeItem(item);
                HomeController.instance.startAnimation(false);
              }
            },
            icon: Icon(
              Icons.add,
              color: isDark
                  ? cartController.isOnTheCart(item)
                      ? TColors.primary
                      : TColors.white
                  : cartController.isOnTheCart(item)
                      ? TColors.secondary
                      : TColors.black,
            ));
      },
    );
  }
}
