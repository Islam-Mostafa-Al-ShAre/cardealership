import 'package:cardealership/utils/constants/text_strings.dart';
import 'package:cardealership/utils/device/device_utility.dart';
import 'package:cardealership/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DetailsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = THelperFunctions.isDarkMode(context);
    return AppBar(
      leading: IconButton(
          color: isDark ? Colors.white : Colors.black,
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back)),
      title: Text(
        AppTexts.detailsTitle,
        style: Theme.of(context).textTheme.headlineLarge,
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize =>
      Size(TDeviceUtils.getScreenWidth(), TDeviceUtils.getAppBarHeight());
}
