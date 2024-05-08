import 'package:cardealership/controllers/cart_controller.dart';
import 'package:cardealership/models/car_model.dart';
import 'package:cardealership/models/item.dart';
import 'package:cardealership/utils/constants/colors.dart';
import 'package:cardealership/utils/constants/sizes.dart';

import 'package:cardealership/utils/device/device_utility.dart';
import 'package:cardealership/utils/helpers/helper_functions.dart';
import 'package:cardealership/views/global_widgets/custom_spaces.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class CartItems extends StatelessWidget {
  CartItems({
    super.key,
  });

  final CartController cartController = CartController.instance;

  @override
  Widget build(BuildContext context) {
    bool isDark = THelperFunctions.isDarkMode(context);
    return SizedBox(
      height: TDeviceUtils.getScreenHeight() * .60,
      child: ListView.separated(
          itemBuilder: (context, index) {
            Item item = cartController.cartItems[index];
            return Dismissible(
              onDismissed: (direction) {
                cartController.removeItem(item);
              },
              key: Key(item.id.toString()),
              child: Container(
                padding: const EdgeInsets.all(TSizes.xs),
                color: isDark ? TColors.dark : TColors.light,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      width: 120,
                      child: item is CarModel
                          ? Image.network(
                              item.image,
                              width: TDeviceUtils.getScreenWidth() / 2,
                              height: TDeviceUtils.getScreenWidth() / 2,
                            )
                          : Image.asset(
                              item.image,
                              width: TDeviceUtils.getScreenWidth() / 2,
                              height: TDeviceUtils.getScreenWidth() / 2,
                            ),
                    ),
                    Column(
                      children: [
                        Text(
                          item.title,
                        ),
                        verticalSpace(10),
                        Text(
                          item.price.toString(),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(FontAwesomeIcons.plus)),
                        GetBuilder<CartController>(builder: (controller) {
                          return const Text("1");
                        }),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(FontAwesomeIcons.minus))
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) =>
              const VerticalSpace(height: TSizes.spaceBtwItems),
          itemCount: cartController.itemCount()),
    );
  }
}
