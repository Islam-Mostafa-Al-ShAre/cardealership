import 'package:cardealership/controllers/favorite_controller.dart';
import 'package:cardealership/models/item.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class FavoirteIcon extends StatelessWidget {
  FavoirteIcon({
    super.key,
    required this.item,
  });

  final FavoriteController favoriteController = FavoriteController.instance;
  final Item item;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteController>(
      builder: (controller) {
        return IconButton(
          onPressed: () {
            favoriteController.addItem(item);
          },
          icon: Icon(
            item.isFavoirte ? Icons.favorite : Icons.favorite_border,
            color: const Color.fromARGB(255, 128, 24, 24),
          ),
        );
      },
    );
  }
}
