import 'package:cardealership/controllers/favorite_controller.dart';
import 'package:cardealership/models/car_model.dart';
import 'package:cardealership/models/item.dart';
import 'package:cardealership/utils/constants/colors.dart';
import 'package:cardealership/utils/constants/sizes.dart';
import 'package:cardealership/utils/device/device_utility.dart';
import 'package:cardealership/utils/helpers/helper_functions.dart';
import 'package:cardealership/views/global_widgets/custom_spaces.dart';
import 'package:cardealership/views/global_widgets/product_interaction_bar.dart';
import 'package:cardealership/views/pages/home_screen/widgets/home_buy_rent_product.dart';
import 'package:flutter/material.dart';

class FavoriteItemVeiw extends StatelessWidget {
  FavoriteItemVeiw({
    super.key,
    required this.item,
    required this.index,
  });

  final FavoriteController favoriteController = FavoriteController.instance;
  final Item item;
  final int index;

  @override
  Widget build(BuildContext context) {
    final bool isdark = THelperFunctions.isDarkMode(context);
    return Dismissible(
      onDismissed: (direction) {
        favoriteController.removeItem(item);
      },
      key: Key(index.toString()),
      child: Container(
        color: isdark ? TColors.dark : TColors.light,
        padding: const EdgeInsets.all(TSizes.md),
        child: Column(
          children: [
            // user interaction bar
            ProductInteractionBar(
              item: item,
              child: Container(),
            ),
            const VerticalSpace(
              height: TSizes.sm,
            ),
            //favorite image
            item is CarModel
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

            //buy and rend btns
            BuyRentProduct(item: item)
          ],
        ),
      ),
    );
  }
}
