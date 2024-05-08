import 'package:cardealership/controllers/home_controller.dart';
import 'package:cardealership/utils/constants/text_strings.dart';
import 'package:cardealership/utils/device/device_utility.dart';
import 'package:cardealership/views/animation_widget/add_cart_animation.dart';
import 'package:cardealership/views/global_widgets/app_drawer.dart';
import 'package:cardealership/views/global_widgets/custom_appbar.dart';
import 'package:cardealership/views/pages/home_screen/widgets/home_cars_models.dart';
import 'package:cardealership/views/pages/home_screen/widgets/home_product_view.dart';
import 'package:cardealership/views/global_widgets/custom_spaces.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  HomeController homeController = HomeController.instance;
  @override
  void initState() {
    super.initState();
    homeController.initlizeAddToCartAnimation(this);
  }

  @override
  void dispose() {
    homeController.addToCartAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: AppTexts.homeAppBarTitle,
          hasCartIcon: true,
        ),
        drawer: getDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalSpace(height: TDeviceUtils.getScreenHeight() * .01),
                //search bar
                const SearchBar(
                  hintText: AppTexts.search,
                ),
                VerticalSpace(height: TDeviceUtils.getScreenHeight() * .02),
                // brands title
                Text(AppTexts.homeBrandTitle,
                    style: Theme.of(context).textTheme.headlineMedium),
                VerticalSpace(height: TDeviceUtils.getScreenHeight() * .01),
                //cars models view
                const HomeCarsModels(),
                VerticalSpace(height: TDeviceUtils.getScreenHeight() * .02),
                // products view
                const HomeProductView()
              ],
            ),
            AddToCartAnimationWidget(controller: homeController)
          ]),
        ));
  }
}
