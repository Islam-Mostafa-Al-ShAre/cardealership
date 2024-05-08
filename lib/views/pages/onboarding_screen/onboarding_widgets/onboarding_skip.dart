import 'package:cardealership/controllers/onboardingscreen_controller.dart';
import 'package:cardealership/utils/constants/sizes.dart';
import 'package:cardealership/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class OnBoardingSkip extends StatelessWidget {
  OnBoardingSkip({
    super.key,
  });
  final onBoardingController = OnBoardingController.instance;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: TSizes.defaultSpace,
      child: GestureDetector(
          onTap: onBoardingController.skipPage, child: const Text("Skip")),
    );
  }
}
