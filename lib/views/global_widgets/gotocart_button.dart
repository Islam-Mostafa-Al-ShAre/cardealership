import 'package:cardealership/controllers/cart_controller.dart';
import 'package:cardealership/utils/constants/colors.dart';
import 'package:cardealership/utils/constants/text_strings.dart';
import 'package:cardealership/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class GoToCartButton extends StatelessWidget {
  GoToCartButton({
    super.key,
  });
  final CartController _cartController = CartController.instance;

  @override
  Widget build(BuildContext context) {
    bool isDark = THelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        Positioned(
            bottom: -5,
            right: 0,
            child: Obx(
              () => Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: TColors.black.withOpacity(.2),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  _cartController.itemCounts.value > 9
                      ? "+9"
                      : _cartController.itemCounts.value.toString(),
                  textAlign: TextAlign.center,
                ),
              ),
            )),
        IconButton(
            onPressed: () {
              Get.toNamed(AppTexts.cartPage);
            },
            icon: Icon(
              FontAwesomeIcons.cartArrowDown,
              color: isDark ? TColors.white : TColors.black,
            )),
      ],
    );
  }
}
