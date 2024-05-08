import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SparePartsController extends GetxController {
  late AnimationController addToCartAnimationController;
  late Animation<double> animation;
  static SparePartsController get instance => Get.find();
  int currentDetails = -1;
  String addToCartAimationText = '';

  void initlizeAddToCartAnimation(SingleTickerProviderStateMixin thinker) {
    addToCartAnimationController = AnimationController(
        vsync: thinker, duration: const Duration(seconds: 1));

    animation = CurvedAnimation(
        parent: addToCartAnimationController, curve: Curves.easeInQuart);
  }

  void startAnimation(bool isAdd) {
    isAdd ? addToCartAimationText = "+1" : addToCartAimationText = "-1";
    addToCartAnimationController.reset();
    addToCartAnimationController.forward();
  }
}
