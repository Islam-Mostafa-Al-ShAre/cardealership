import 'package:cardealership/utils/constants/colors.dart';
import 'package:cardealership/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class TLoading {
  static void opendLoading(String text) {
    bool isDark = THelperFunctions.isDarkMode(Get.context!);
    showDialog(
        barrierColor: Colors.black,
        barrierDismissible: false,
        context: Get.overlayContext!,
        builder: (_) => PopScope(
            canPop: false,
            child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Center(
                  child: LoadingAnimationWidget.newtonCradle(
                    color: isDark ? TColors.primary : TColors.secondary,
                    size: 150,
                  ),
                ))));
  }

  static void stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
