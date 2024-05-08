import 'package:cardealership/controllers/bottom_navigationbar_controller.dart';
import 'package:cardealership/utils/constants/sizes.dart';
import 'package:cardealership/utils/helpers/helper_functions.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

// ignore: must_be_immutable
class NavigationMenu extends StatelessWidget {
  NavigationMenu({super.key});
  final BottomNavigationBarController _controller =
      Get.put(BottomNavigationBarController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    bool isDark = THelperFunctions.isDarkMode(context);
    return Obx(
      () => Scaffold(
        bottomNavigationBar: NavigationBar(
          indicatorColor: isDark
              ? const Color.fromARGB(255, 156, 122, 216)
              : const Color.fromARGB(231, 245, 152, 124),
          indicatorShape:
              BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 0,
          height: TSizes.bottomAppBarHeight,
          selectedIndex: _controller.barInxdx.value,
          onDestinationSelected: (index) => _controller.SetbarIndex = index,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: "Cars"),
            NavigationDestination(
                icon: Icon(FontAwesomeIcons.carBattery), label: "Spare"),
            NavigationDestination(
                icon: Icon(FontAwesomeIcons.heart), label: "WishList"),
            NavigationDestination(icon: Icon(Icons.money), label: "Sale"),
            NavigationDestination(icon: Icon(Icons.person), label: "Profile")
          ],
        ),
        body: _controller.pages[_controller.barInxdx.value],
      ),
    );
  }
}
