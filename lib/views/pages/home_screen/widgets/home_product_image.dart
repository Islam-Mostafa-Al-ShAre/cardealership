import 'package:cardealership/controllers/home_controller.dart';

import 'package:cardealership/models/item.dart';
import 'package:cardealership/utils/constants/text_strings.dart';
import 'package:cardealership/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeProductImage extends StatelessWidget {
  HomeProductImage({
    super.key,
    required this.item,
  });

  final HomeController homeController = HomeController.instance;
  final Item item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: THelperFunctions.screenWidth(),
      child: InkWell(
        onTap: () {
          homeController.currentDetails = item.id;
          Get.toNamed(AppTexts.detailsPage);
        },
        child: Hero(
          tag: "${item.id}",
          child: Image.network(
            item.image,
            fit: BoxFit.fill,
            width: THelperFunctions.screenWidth(),
            height: 200,
          ),
        ),
      ),
    );
  }
}
