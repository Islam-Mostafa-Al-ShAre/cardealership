import 'package:cardealership/controllers/onboardingscreen_controller.dart';
import 'package:cardealership/utils/constants/image_strings.dart';
import 'package:cardealership/utils/constants/text_strings.dart';
import 'package:cardealership/views/pages/onboarding_screen/onboarding_widgets/onboarding_indicator.dart';
import 'package:cardealership/views/pages/onboarding_screen/onboarding_widgets/onboarding_next_button.dart';
import 'package:cardealership/views/pages/onboarding_screen/onboarding_widgets/onboarding_page.dart';
import 'package:cardealership/views/pages/onboarding_screen/onboarding_widgets/onboarding_skip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});
  final OnBoardingController _boardingController =
      Get.put<OnBoardingController>(OnBoardingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //our three onboarding pages
          PageView(
            onPageChanged: _boardingController.updatePageIndicator,
            controller: _boardingController.pageController,
            children: const [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: AppTexts.onBoardingTitle1,
                subTitle: AppTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: AppTexts.onBoardingTitle2,
                subTitle: AppTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: AppTexts.onBoardingTitle3,
                subTitle: AppTexts.onBoardingSubTitle3,
              ),
            ],
          ),
          //skip
          OnBoardingSkip(),
          //indicator
          OnBoardingIndicator(),
          //next button
          OnBoardingNextButton()
        ],
      ),
    );
  }
}
