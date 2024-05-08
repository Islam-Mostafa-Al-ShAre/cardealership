import 'package:cardealership/models/user_model.dart';
import 'package:cardealership/utils/exceptions/firebase_exceptions.dart';
import 'package:cardealership/utils/exceptions/format_exceptions.dart';
import 'package:cardealership/utils/exceptions/platform_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //save user data in fire store

  saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
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

  //fatch user data
  Future<UserModel> fatchUserIndformation() async {
    try {
      final document = await _db
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .get();

      if (document.exists) {
        return UserModel.FromSnapShot(document);
      } else {
        return UserModel(
            email: '',
            id: '',
            phoneNumber: '',
            firstName: '',
            lastName: '',
            profilePicture: '',
            userName: '');
      }
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
