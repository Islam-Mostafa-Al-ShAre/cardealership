import 'package:cardealership/controllers/onboardingscreen_controller.dart';
import 'package:cardealership/utils/constants/colors.dart';
import 'package:cardealership/utils/constants/sizes.dart';
import 'package:cardealership/utils/device/device_utility.dart';
import 'package:cardealership/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingIndicator extends StatelessWidget {
  OnBoardingIndicator({
    super.key,
  });

  final onboardingController = OnBoardingController.instance;

  @override
  Widget build(BuildContext context) {
    final bool isDark = THelperFunctions.isDarkMode(context);
    return Positioned(
        left: TSizes.defaultSpace,
        bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,
        child: SmoothPageIndicator(
          onDotClicked: onboardingController.dotNavigationClick,
          controller: onboardingController.pageController,
          count: 3,
          effect: ExpandingDotsEffect(
              activeDotColor: isDark ? TColors.light : TColors.dark,
              dotHeight: 6),
        ));
  }
}
