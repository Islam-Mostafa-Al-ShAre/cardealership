import 'package:cardealership/controllers/cart_controller.dart';
import 'package:cardealership/controllers/spare_part_controller.dart';
import 'package:cardealership/models/item.dart';
import 'package:cardealership/models/spare_part_model.dart';
import 'package:cardealership/utils/constants/colors.dart';
import 'package:cardealership/utils/constants/sizes.dart';
import 'package:cardealership/utils/constants/text_strings.dart';
import 'package:cardealership/utils/device/device_utility.dart';
import 'package:cardealership/utils/helpers/helper_functions.dart';
import 'package:cardealership/views/global_widgets/custom_button.dart';
import 'package:cardealership/views/global_widgets/custom_spaces.dart';
import 'package:cardealership/views/global_widgets/product_interaction_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class SparePartsProductsView extends StatelessWidget {
  SparePartsProductsView({
    super.key,
  });

  final CartController cartController = CartController.instance;

  @override
  Widget build(BuildContext context) {
    bool isDark = THelperFunctions.isDarkMode(context);
    return Expanded(
      child: ListView.separated(
        itemCount: sparePartsItems.length,
        separatorBuilder: (context, index) => const VerticalSpace(
          height: TSizes.spaceBtwItems,
        ),
        itemBuilder: (context, index) {
          Item item = sparePartsItems[index];
          return Container(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              width: TDeviceUtils.getScreenWidth(),
              decoration: BoxDecoration(
                color: isDark ? TColors.dark : TColors.light,
                borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
              ),
              child: Column(
                children: [
                  //interactive bar
                  ProductInteractionBar(
                    item: item,
                    child: SparePartsAddToCart(
                      item: item,
                    ),
                  ),
                  // item image
                  Image(
                    width: TDeviceUtils.getScreenWidth() / 2,
                    image: AssetImage(item.image),
                  ),
                  const VerticalSpace(height: TSizes.spaceBtwItems),
                  // buy btn
                  Column(
                    children: [
                      Text("${item.price} \$"),
                      const VerticalSpace(height: TSizes.spaceBtwItems),
                      CostomButton(
                        OnPressed: () {},
                        text: AppTexts.buy,
                      )
                    ],
                  )
                ],
              ));
        },
      ),
    );
  }
}

class SparePartsAddToCart extends StatelessWidget {
  SparePartsAddToCart({
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
                SparePartsController.instance.startAnimation(true);
              } else {
                cartController.removeItem(item);
                SparePartsController.instance.startAnimation(false);
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
