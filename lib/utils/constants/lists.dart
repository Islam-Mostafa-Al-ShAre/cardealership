import 'package:cardealership/utils/constants/text_strings.dart';
import 'package:cardealership/views/pages/cart_screen/cart_screen.dart';
import 'package:cardealership/views/pages/details_screen/details.dart';
import 'package:cardealership/views/pages/favorite_screen/favorite_screen.dart';
import 'package:cardealership/views/pages/home_screen/home_screen.dart';
import 'package:cardealership/views/pages/auth_screens/login_screen.dart';
import 'package:cardealership/views/pages/navigation_menu/navigation_menu.dart';
import 'package:cardealership/views/pages/onboarding_screen/onboarding_screen.dart';
import 'package:cardealership/views/pages/auth_screens/signup_screen.dart';
import 'package:cardealership/views/pages/spare_part_screen/spare_parts.dart';
import 'package:cardealership/views/pages/splash_screen.dart';
import 'package:get/get.dart';

class AppLists {
  static var getPages = [
    GetPage(name: AppTexts.splashPage, page: () => const SplashScreen()),
    GetPage(name: AppTexts.onboardingPage, page: () => OnBoardingScreen()),
    GetPage(name: AppTexts.loginPage, page: () => LoginScreen()),
    GetPage(
      name: AppTexts.registerPage,
      page: () => RegisterScreen(),
    ),
    GetPage(name: AppTexts.main, page: () => NavigationMenu()),
    GetPage(
      name: AppTexts.homePage,
      page: () => const HomeScreen(),
    ),
    GetPage(name: AppTexts.favoritePage, page: () => FavoriteScreen()),
    GetPage(
      name: AppTexts.sparePartsPage,
      page: () => const SparePartsScreen(),
    ),
    GetPage(name: AppTexts.detailsPage, page: () => const Details()),
    GetPage(name: AppTexts.cartPage, page: () => CartScreen())
  ];
}
