import 'package:cardealership/utils/exceptions/firebase_exceptions.dart';
import 'package:cardealership/utils/exceptions/format_exceptions.dart';
import 'package:cardealership/utils/exceptions/platform_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CarRepository extends GetxController {
  static CarRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //save user data in fire store

  //fatch user data
  Future<QuerySnapshot<Map<String, dynamic>>> fetchCars() async {
    try {
      final documents = await _db.collection("Cars").get();

      return documents;
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
