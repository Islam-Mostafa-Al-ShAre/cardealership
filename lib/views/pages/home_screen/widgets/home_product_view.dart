import 'package:cardealership/controllers/home_controller.dart';
import 'package:cardealership/models/car_model.dart';
import 'package:cardealership/models/item.dart';
import 'package:cardealership/utils/constants/colors.dart';
import 'package:cardealership/utils/constants/sizes.dart';
import 'package:cardealership/utils/helpers/helper_functions.dart';
import 'package:cardealership/views/global_widgets/custom_spaces.dart';
import 'package:cardealership/views/pages/home_screen/widgets/home_add_to_cart.dart';
import 'package:cardealership/views/pages/home_screen/widgets/home_buy_rent_product.dart';
import 'package:cardealership/views/pages/home_screen/widgets/home_product_image.dart';
import 'package:cardealership/views/global_widgets/product_interaction_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeProductView extends StatelessWidget {
  const HomeProductView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isdark = THelperFunctions.isDarkMode(context);
    return Expanded(
      child: Obx(() {
        return ListView.separated(
          // ignore: invalid_use_of_protected_member
          itemCount: HomeController.instance.cars.value.length,
          separatorBuilder: (context, index) =>
              verticalSpace(TSizes.spaceBtwItems),
          itemBuilder: (context, index) {
            // ignore: invalid_use_of_protected_member
            Item item = HomeController.instance.cars.value[index];
            return Container(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              width: THelperFunctions.screenWidth(),
              decoration: BoxDecoration(
                color: isdark ? TColors.dark : TColors.light,
                borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
              ),
              child: Column(
                children: [
                  // product interaction bar
                  ProductInteractionBar(
                    item: item,
                    child: HomeAddToCart(
                      item: item,
                    ),
                  ),
                  //vertical space
                  const VerticalSpace(
                    height: TSizes.sm,
                  ),
                  //product image
                  HomeProductImage(item: item),
                  //vertical space
                  const VerticalSpace(
                    height: TSizes.md,
                  ),
                  //home buy and rent button with price text
                  BuyRentProduct(item: item as CarModel),
                  //vertical space
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
