import 'package:cardealership/controllers/bottom_navigationbar_controller.dart';
import 'package:cardealership/utils/constants/sizes.dart';
import 'package:cardealership/utils/constants/text_strings.dart';
import 'package:cardealership/utils/device/device_utility.dart';

import 'package:cardealership/views/global_widgets/custom_spaces.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

getDrawer() {
  return Drawer(
    width: TDeviceUtils.getScreenWidth() / 2,
    child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VerticalSpace(
              height: TSizes.appBarHeight,
            ),
            //Home
            InkWell(
              onTap: () =>
                  BottomNavigationBarController.instance.SetbarIndex = 0,
              child: const Text(AppTexts.drawerHome),
            ),
            const SizedBox(
                child: Divider(
              thickness: 1,
            )),
            //sale Your Car
            const VerticalSpace(
              height: TSizes.sm,
            ),
            InkWell(
              onTap: () =>
                  BottomNavigationBarController.instance.SetbarIndex = 3,
              child: const Text(AppTexts.drawerSaleCar),
            ),
            const SizedBox(
                child: Divider(
              thickness: 1,
            )),
            const VerticalSpace(
              height: TSizes.sm,
            ),

            //spare parts
            InkWell(
              onTap: () =>
                  BottomNavigationBarController.instance.SetbarIndex = 1,
              child: const Text(AppTexts.drawerSpareParts),
            ),
            const SizedBox(
                child: Divider(
              thickness: 1,
            )),
            const VerticalSpace(
              height: TSizes.sm,
            ),
            //favorites
            InkWell(
              onTap: () =>
                  BottomNavigationBarController.instance.SetbarIndex = 2,
              child: const Text(AppTexts.drawerFavorite),
            ),
            const SizedBox(
                child: Divider(
              thickness: 1,
            )),

            //cart
            const VerticalSpace(
              height: TSizes.sm,
            ),
            InkWell(
              onTap: () => Get.toNamed(AppTexts.cartPage),
              child: const Text(AppTexts.drawerCart),
            ),
            const SizedBox(
                child: Divider(
              thickness: 1,
            )),
            //chat us
            const VerticalSpace(
              height: TSizes.sm,
            ),
            const InkWell(
              child: Text(AppTexts.drawerChatUs),
            ),
          ],
        )),
  );
}
