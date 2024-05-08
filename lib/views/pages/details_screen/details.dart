// ignore_for_file: invalid_use_of_protected_member

import 'package:cardealership/controllers/home_controller.dart';
import 'package:cardealership/models/car_model.dart';
import 'package:cardealership/utils/constants/sizes.dart';
import 'package:cardealership/utils/constants/text_strings.dart';
import 'package:cardealership/views/pages/details_screen/widgets/details_app_bar.dart';
import 'package:cardealership/views/pages/home_screen/widgets/home_buy_rent_product.dart';
import 'package:cardealership/views/global_widgets/custom_spaces.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> with SingleTickerProviderStateMixin {
  HomeController homeController = Get.find();
  late CarModel car;

  late AnimationController _animationAllController;
  late Animation<double> _animationAll;
  late Animation<double> _animationBtns;

  void inslizeAnimation() {
    _animationAllController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _animationAll = CurvedAnimation(
        parent: _animationAllController, curve: const Interval(.2, .6));
    _animationBtns = CurvedAnimation(
        parent: _animationAllController, curve: const Interval(.8, 1));
    _animationAllController.forward();
  }

  @override
  void initState() {
    super.initState();
    inslizeAnimation();
    car = HomeController.instance.cars.value
        .where((element) => element.id == homeController.currentDetails)
        .toList()[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DetailsAppBar(),
      body: AnimatedBuilder(
          animation: _animationAllController,
          builder: (context, child) {
            return LayoutBuilder(builder: (contxt, constrains) {
              return Container(
                  padding: const EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 100 * (1 - _animationAll.value) - 50,
                        width: constrains.maxWidth,
                        height: constrains.maxHeight,
                        child: Opacity(
                          opacity: _animationAll.value,
                          child: Column(
                            children: [
                              //vertical space
                              const Spacer(),
                              //hero image

                              Image.network(
                                car.image,
                                width: constrains.maxWidth,
                              ),
                              const Spacer(),
                              //product title
                              Text(
                                car.title,
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              const VerticalSpace(height: TSizes.spaceSm),
                              // car fetures
                              Text(
                                textAlign: TextAlign.center,
                                AppTexts.carFetures,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const Spacer(),
                              // buy rent buttons with price
                              Opacity(
                                opacity: _animationBtns.value,
                                child: BuyRentProduct(
                                  item: car,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ));
            });
          }),
    );
  }
}
