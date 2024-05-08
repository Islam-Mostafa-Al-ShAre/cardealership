import 'package:cardealership/models/item.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  static FavoriteController get instance => Get.find();
  final List<Item> _favoriteItems = [];

  List<Item> get favoriteItems => _favoriteItems;

  void addItem(Item item) {
    if (!(item.isFavoirte)) {
      _favoriteItems.add(item);
    } else {
      _favoriteItems.remove(item);
    }
    item.isFavoirte = !item.isFavoirte;
    update();
  }

  void removeItem(Item item) {
    _favoriteItems.remove(item);
    item.isFavoirte = false;
  }

  int itemsCount() {
    return _favoriteItems.length;
  }
}
