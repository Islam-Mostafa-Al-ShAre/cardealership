import 'package:cardealership/controllers/repository/auth_repository.dart';
import 'package:cardealership/utils/constants/loading.dart';
import 'package:cardealership/utils/popups/error_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController instance = Get.find();

  // screen text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  @override
  onReady() {
    emailController.text = "islamer@gmail.com";
    passwordController.text = "Islam123!";
  }

  Future<void> emailAndPasswordLogin() async {
    try {
      TLoading.opendLoading("loding");
      //check first the failds is not empty
      if (!loginFormKey.currentState!.validate()) {
        throw 'Compelete the Form First';
      }
      //save the data if remamber me is selected
      //login
      await AuthRepository.authRepository.loginWithEmailAndPassword(
          emailController.text.trim(), passwordController.text.trim());
      //the process is complete
      secussSnackBAar("Login Complete");

      TLoading.stopLoading();
      //
      AuthRepository.authRepository.screenRiediract();
    } catch (e) {
      TLoading.stopLoading();
      errorSnackBAar(e.toString());
    }
  }
}
