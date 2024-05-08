import 'package:cardealership/controllers/onboardingscreen_controller.dart';
import 'package:cardealership/utils/constants/sizes.dart';
import 'package:cardealership/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class OnBoardingNextButton extends StatelessWidget {
  OnBoardingNextButton({
    super.key,
  });

  final onboardingController = OnBoardingController.instance;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      right: TSizes.defaultSpace,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(shape: const CircleBorder()),
          onPressed: onboardingController.nextPage,
          child: const Icon(Icons.arrow_forward)),
    );
  }
}
