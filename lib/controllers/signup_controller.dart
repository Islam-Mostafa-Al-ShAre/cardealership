import 'package:cardealership/controllers/repository/auth_repository.dart';
import 'package:cardealership/controllers/repository/user_repository.dart';
import 'package:cardealership/models/user_model.dart';
import 'package:cardealership/utils/constants/loading.dart';
import 'package:cardealership/utils/popups/error_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController instance = Get.find();

  // screen text editing controllers
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // final NetworkManager _networkManager = Get.put(NetworkManager());
  @override
  onReady() {
    firstNameController.text = "islam";
    lastNameController.text = "Moustafa";
    emailController.text = "islamer@gmail.com";
    passwordController.text = "Islam123!";
    phoneNumberController.text = "01026274954";
  }

  Future<void> signUp() async {
    try {
      //check the internet

      //check the form inputs
      TLoading.opendLoading("start");
      if (!signupFormKey.currentState!.validate()) {
        throw "complete Form please";
      }

      //sign up in the firebase
      UserCredential userCredential = await AuthRepository.authRepository
          .registerWithEmailAndPassword(
              emailController.text.trim(), passwordController.text.trim());

      //save user info in fireStore
      UserModel userModel = UserModel(
          id: userCredential.user!.uid.trim(),
          firstName: firstNameController.text.trim(),
          lastName: lastNameController.text.trim(),
          userName: firstNameController.text + "238#2123".trim(),
          email: emailController.text.trim(),
          phoneNumber: phoneNumberController.text.trim(),
          profilePicture: '');

      UserRepository userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(userModel);
      secussSnackBAar("sign in compelete");
      // Get.offNamed(AppTexts.loginPage);
    } catch (e) {
      errorSnackBAar(e.toString());
    } finally {
      TLoading.stopLoading();
    }
  }
}
