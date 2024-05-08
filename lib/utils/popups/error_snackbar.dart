import 'package:flutter/material.dart';
import 'package:get/get.dart';

errorSnackBAar(String errorText) {
  return Get.snackbar(
    "Error",
    errorText,
    icon: const Icon(Icons.person, color: Colors.white),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: const Color.fromARGB(255, 201, 97, 97),
  );
}

secussSnackBAar(String secuss) {
  return Get.snackbar(
    "Secuss",
    secuss,
    icon: const Icon(Icons.person, color: Colors.white),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: const Color.fromARGB(255, 97, 201, 104),
  );
}
