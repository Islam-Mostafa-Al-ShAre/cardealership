import 'package:cardealership/models/item.dart';
import 'package:cardealership/utils/constants/sizes.dart';
import 'package:cardealership/utils/device/device_utility.dart';
import 'package:cardealership/views/global_widgets/custom_spaces.dart';
import 'package:cardealership/views/global_widgets/favorite_Icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductInteractionBar extends StatelessWidget {
  const ProductInteractionBar({
    super.key,
    required this.item,
    required this.child,
  });

  final Item item;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: TDeviceUtils.getScreenWidth(),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //rating
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              itemSize: TSizes.iconSm,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {},
            ),
            const HorizontalSpace(width: TSizes.xs),

            //product title
            SizedBox(
              width: 120,
              child: Text(
                textAlign: TextAlign.center,
                item.title,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            const HorizontalSpace(width: TSizes.xs),
            //favorite icon
            FavoirteIcon(item: item),
            const HorizontalSpace(width: TSizes.xs),
            //add to cart icon
            child
          ],
        ),
      ),
    );
  }
}
