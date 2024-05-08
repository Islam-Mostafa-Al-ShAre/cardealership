import 'package:cardealership/controllers/cart_controller.dart';
import 'package:cardealership/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class CartTotalPrice extends StatelessWidget {
  CartTotalPrice({
    super.key,
  });

  final CartController cartController = CartController.instance;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(AppTexts.cartTotal,
            style: Theme.of(context).textTheme.headlineSmall),
        GetBuilder<CartController>(builder: (controller) {
          return Text(
            "${cartController.getTotalPrice()} \$",
            style: Theme.of(context).textTheme.headlineSmall,
          );
        })
      ],
    );
  }
}
