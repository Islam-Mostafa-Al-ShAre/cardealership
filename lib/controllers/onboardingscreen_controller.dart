import 'package:cardealership/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();
  // Variables
  final RxInt _currentPage = 0.obs;
  final PageController pageController = PageController();

  ///update Current Index when Page Scroll
  void updatePageIndicator(index) {
    _currentPage.value = index;
  }

  ///Jump to the specific do selected page
  void dotNavigationClick(index) {
    _currentPage.value = index;
    pageController.jumpToPage(_currentPage.value);
  }

  /// update current index & jump to next page
  void nextPage() {
    if (_currentPage.value >= 2) {
      //change the isFirstTime to false, to not open onBoarding screen again
      GetStorage getStorage = GetStorage();
      getStorage.write(AppTexts.gSIsFirstTime, false);
      Get.offNamed(AppTexts.loginPage);
    } else {
      _currentPage.value += 1;
      pageController.jumpToPage(_currentPage.value);
    }
  }

  /// update current index & jump to last page
  void skipPage() {
    _currentPage.value = 2;
    pageController.jumpToPage(2);
  }
}
