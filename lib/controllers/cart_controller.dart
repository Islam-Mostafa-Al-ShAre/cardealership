import 'package:cardealership/models/item.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  //get instance of the cartController
  static CartController get instance => Get.find();
  final List<Item> _cartItems = [];
  RxInt itemCounts = 0.obs;
  List<Item> get cartItems => _cartItems;

  void addItem(Item item) {
    if (!isOnTheCart(item)) {
      itemCounts.value++;
      _cartItems.add(item);
    }
    update();
  }

  void removeItem(Item item) {
    _cartItems.remove(item);
    itemCounts.value--;
    update();
  }

  bool isOnTheCart(Item item) {
    return cartItems.contains(item);
  }

  int itemCount() {
    return itemCounts.value;
  }

  double getTotalPrice() {
    double totalPrice = 0;

    for (var item in _cartItems) {
      totalPrice += item.price;
    }

    return totalPrice;
  }
}
