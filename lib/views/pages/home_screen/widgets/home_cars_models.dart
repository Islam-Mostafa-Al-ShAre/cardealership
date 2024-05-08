import 'package:cardealership/models/brands_model.dart';
import 'package:cardealership/utils/constants/colors.dart';
import 'package:cardealership/utils/constants/sizes.dart';
import 'package:cardealership/utils/helpers/helper_functions.dart';
import 'package:cardealership/views/global_widgets/custom_spaces.dart';
import 'package:flutter/material.dart';

class HomeCarsModels extends StatelessWidget {
  const HomeCarsModels({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = THelperFunctions.isDarkMode(context);
    return Container(
      width: THelperFunctions.screenWidth(),
      height: TSizes.carsModelsHeight,
      padding: const EdgeInsets.all(TSizes.sm),
      decoration: BoxDecoration(
        color: isDark ? TColors.dark : TColors.light,
        borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) => const HorizontalSpace(
          width: TSizes.spaceBtwItems,
        ),
        itemCount: brands.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              //write here the on click logic
            },
            child: Image.asset(
              brands[index].image,
            ),
          );
        },
      ),
    );
  }
}
