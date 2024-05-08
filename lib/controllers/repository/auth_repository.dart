import 'package:cardealership/utils/constants/text_strings.dart';
import 'package:cardealership/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:cardealership/utils/exceptions/firebase_exceptions.dart';
import 'package:cardealership/utils/exceptions/format_exceptions.dart';
import 'package:cardealership/utils/exceptions/platform_exceptions.dart';
import 'package:cardealership/views/pages/auth_screens/login_screen.dart';
import 'package:cardealership/views/pages/navigation_menu/navigation_menu.dart';
import 'package:cardealership/views/pages/onboarding_screen/onboarding_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthRepository extends GetxController {
  static AuthRepository authRepository = Get.find();

  //Variables
  final GetStorage deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  @override
  void onReady() {
    super.onReady();

    screenRiediract();
  }

  // to choose which screen apper
  void screenRiediract() {
    final user = _auth.currentUser;
    // deviceStorage.write(AppTexts.gSIsFirstTime, true);
    if (user != null) {
      //if user login
      Get.offAll(() => NavigationMenu());
    } else {
      //if user not login
      deviceStorage.writeIfNull(AppTexts.gSIsFirstTime, true);
      deviceStorage.read(AppTexts.gSIsFirstTime) != true
          ? Get.offAll(() => LoginScreen())
          : Get.offAll(() => OnBoardingScreen());
    }
  }

  //login
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong. please try again';
    }
  }

  //Register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong. please try again';
    }
  }
}
