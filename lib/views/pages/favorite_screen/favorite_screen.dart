import 'package:cardealership/controllers/favorite_controller.dart';
import 'package:cardealership/models/item.dart';
import 'package:cardealership/utils/constants/sizes.dart';
import 'package:cardealership/utils/constants/text_strings.dart';
import 'package:cardealership/views/global_widgets/app_drawer.dart';
import 'package:cardealership/views/global_widgets/custom_appbar.dart';
import 'package:cardealership/views/global_widgets/custom_spaces.dart';
import 'package:cardealership/views/pages/favorite_screen/widgets/favorite_item_veiw.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});
  FavoriteController favoriteController = FavoriteController.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //custom app bar
      appBar: const CustomAppBar(
        title: AppTexts.favoriteTitle,
        hasCartIcon: false,
      ),
      drawer: getDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ListView.separated(
            separatorBuilder: (context, index) =>
                //separator
                const VerticalSpace(height: TSizes.spaceBtwItems),
            itemBuilder: (context, index) {
              Item item = favoriteController.favoriteItems[index];
              // item view
              return FavoriteItemVeiw(
                item: item,
                index: index,
              );
            },
            itemCount: favoriteController.itemsCount()),
      ),
    );
  }
}
