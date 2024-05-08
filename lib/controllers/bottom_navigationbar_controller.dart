import 'package:cardealership/views/pages/favorite_screen/favorite_screen.dart';
import 'package:cardealership/views/pages/home_screen/home_screen.dart';
import 'package:cardealership/views/pages/profile_screen/profile_screen.dart';
import 'package:cardealership/views/pages/sale_user_car_screen/sale_user_car_screen.dart';
import 'package:cardealership/views/pages/spare_part_screen/spare_parts.dart';

import 'package:get/get.dart';

class BottomNavigationBarController extends GetxController {
  static BottomNavigationBarController get instance => Get.find();
  RxInt barInxdx = 0.obs;
  List pages = [
    const HomeScreen(),
    const SparePartsScreen(),
    FavoriteScreen(),
    const SaleUserCarScreen(),
    ProfileScreen(),
  ];
  set SetbarIndex(index) {
    barInxdx.value = index;
  }
}
