import 'package:cardealership/controllers/cart_controller.dart';
import 'package:cardealership/utils/constants/sizes.dart';
import 'package:cardealership/utils/constants/text_strings.dart';
import 'package:cardealership/views/global_widgets/custom_appbar.dart';
import 'package:cardealership/views/global_widgets/custom_divider.dart';
import 'package:cardealership/views/pages/cart_screen/widets/cart_items.dart';
import 'package:cardealership/views/global_widgets/custom_button.dart';
import 'package:cardealership/views/global_widgets/custom_spaces.dart';
import 'package:cardealership/views/pages/cart_screen/widets/cart_total_price.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppTexts.cartTitle,
        hasCartIcon: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
        child: Column(
          children: [
            const VerticalSpace(height: TSizes.sm),
            // cart items
            CartItems(),
            const VerticalSpace(height: TSizes.spaceBtwSections),
            //divider
            const CustomDivider(),
            const VerticalSpace(height: TSizes.spaceBtwSections),
            //cart Total price
            CartTotalPrice(),
            const Spacer(),
            //check out btn
            CostomButton(
              OnPressed: () {},
              text: AppTexts.CheckOut,
              width: 250,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
