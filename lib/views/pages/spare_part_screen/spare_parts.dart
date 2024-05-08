import 'package:cardealership/controllers/spare_part_controller.dart';
import 'package:cardealership/utils/constants/sizes.dart';
import 'package:cardealership/utils/constants/text_strings.dart';
import 'package:cardealership/views/animation_widget/add_cart_animation.dart';
import 'package:cardealership/views/global_widgets/app_drawer.dart';
import 'package:cardealership/views/global_widgets/custom_appbar.dart';
import 'package:cardealership/views/global_widgets/custom_spaces.dart';
import 'package:cardealership/views/pages/spare_part_screen/widgets/spare_parts_product_view.dart';
import 'package:flutter/material.dart';

class SparePartsScreen extends StatefulWidget {
  const SparePartsScreen({super.key});

  @override
  State<SparePartsScreen> createState() => _SparePartsScreenState();
}

class _SparePartsScreenState extends State<SparePartsScreen>
    with SingleTickerProviderStateMixin {
  SparePartsController sparePartsController = SparePartsController.instance;
  @override
  void initState() {
    super.initState();

    sparePartsController.initlizeAddToCartAnimation(this);
  }

  @override
  void dispose() {
    sparePartsController.addToCartAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
            title: AppTexts.sparePartsTitle, hasCartIcon: true),
        drawer: getDrawer(),
        body: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Stack(children: [
              Column(
                children: [
                  const VerticalSpace(
                    height: TSizes.spaceBtwSections,
                  ),
                  //search bar
                  const SearchBar(),
                  const VerticalSpace(
                    height: TSizes.spaceBtwSections,
                  ),
                  //spare parts products
                  SparePartsProductsView()
                ],
              ),
              AddToCartAnimationWidget(controller: sparePartsController)
            ])));
  }
}
