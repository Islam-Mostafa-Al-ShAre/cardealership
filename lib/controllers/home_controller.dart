import 'package:cardealership/controllers/repository/car_repository.dart';
import 'package:cardealership/models/car_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late AnimationController addToCartAnimationController;
  late Animation<double> animation;
  static HomeController get instance => Get.find();
  int currentDetails = -1;
  String addToCartAimationText = '';
  RxList cars = [].obs;
  CarRepository carRepository = Get.put(CarRepository());

  @override
  void onInit() async {
    super.onInit();

    QuerySnapshot<Map<String, dynamic>> carsDoument =
        await carRepository.fetchCars();

    for (var doument in carsDoument.docs) {
      // ignore: invalid_use_of_protected_member
      cars.value.add(CarModel.FromSnapShot(doument));
    }
  }

  void initlizeAddToCartAnimation(SingleTickerProviderStateMixin thinker) {
    addToCartAnimationController = AnimationController(
        vsync: thinker, duration: const Duration(seconds: 1));

    animation = CurvedAnimation(
        parent: addToCartAnimationController, curve: Curves.easeInQuart);
  }

  void startAnimation(bool isAdd) {
    isAdd ? addToCartAimationText = "+1" : addToCartAimationText = "-1";
    addToCartAnimationController.reset();
    addToCartAnimationController.forward();
  }
}
