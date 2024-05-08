import 'package:cardealership/utils/constants/colors.dart';
import 'package:cardealership/utils/constants/sizes.dart';
import 'package:cardealership/utils/device/device_utility.dart';
import 'package:cardealership/utils/helpers/helper_functions.dart';
import 'package:cardealership/views/global_widgets/gotocart_button.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key, required this.title, required this.hasCartIcon});

  final String title;
  final bool hasCartIcon;
  @override
  Widget build(BuildContext context) {
    bool isDark = THelperFunctions.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: AppBar(
        iconTheme: IconThemeData(color: isDark ? TColors.white : TColors.black),
        actions: [if (hasCartIcon) GoToCartButton()],
        title: Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: true,
      ),
    );
  }

  @override
  Size get preferredSize {
    return Size(TDeviceUtils.getScreenWidth(), TSizes.appBarHeight);
  }
}
