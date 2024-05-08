import 'package:cardealership/models/item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CarModel extends Item {
  final int rentPrice;

  CarModel({
    required this.rentPrice,
    required super.isFavoirte,
    required super.id,
    required super.image,
    required super.title,
    required super.price,
  });

  static String generateUserName(String fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUserName = "$firstName$lastName";
    String userNameWithPrefix = "cwt_$camelCaseUserName";
    return userNameWithPrefix;
  }

  //convert model to json Structure
  Map<String, dynamic> toJson() {
    return {
      'RentPrice': rentPrice,
      'IsFavoirte': isFavoirte,
      'Id': id,
      'Image': image,
      'Tite': title,
      'Price': price
    };
  }

  factory CarModel.FromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return CarModel(
        id: data["Id"] ?? 0,
        isFavoirte: data['IsFavoirte'] ?? false,
        rentPrice: data['RentPrice'] ?? 0,
        price: data['Price'] ?? 0,
        title: data['Title'],
        image: data['Image'] ?? '',
      );
    }
    return CarModel(
      id: 0,
      image: '',
      isFavoirte: false,
      price: 0,
      rentPrice: 0,
      title: '',
    );
  }
}

List<CarModel> cars = [
  CarModel(
      price: 100000,
      rentPrice: 1000,
      id: 1,
      image: 'assets/images/mer_s.png',
      title: 'Mercedes S Class',
      isFavoirte: false),
  CarModel(
      id: 2,
      price: 100000,
      rentPrice: 1000,
      image: 'assets/images/mer_gls.png',
      title: ' Mercedes GLS',
      isFavoirte: false),
  CarModel(
      price: 100000,
      rentPrice: 1000,
      id: 3,
      image: 'assets/images/mer_gle.png',
      title: 'Mercedes GLE',
      isFavoirte: false),
  CarModel(
      id: 4,
      price: 100000,
      rentPrice: 1000,
      image: 'assets/images/mer_gls.png',
      title: ' Mercedes GLS',
      isFavoirte: false),
  CarModel(
      id: 5,
      price: 100000,
      rentPrice: 1000,
      image: 'assets/images/mer_gls.png',
      title: ' Mercedes GLS',
      isFavoirte: false),
  CarModel(
      id: 6,
      price: 100000,
      rentPrice: 1000,
      image: 'assets/images/mer_gls.png',
      title: ' Mercedes GLS',
      isFavoirte: false),
];
