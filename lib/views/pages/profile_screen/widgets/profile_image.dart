import 'package:cardealership/utils/constants/colors.dart';
import 'package:cardealership/utils/constants/sizes.dart';
import 'package:cardealership/utils/constants/text_strings.dart';
import 'package:cardealership/utils/helpers/helper_functions.dart';
import 'package:cardealership/views/global_widgets/custom_spaces.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.isDark,
  });

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: THelperFunctions.screenWidth(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100.0,
            width: 100.0,
            decoration: BoxDecoration(
              border: Border.all(
                  color: isDark ? TColors.primary : TColors.secondary,
                  width: 2),
              image: const DecorationImage(
                image: AssetImage("assets/images/profile.jfif"),
                fit: BoxFit.fill,
              ),
              shape: BoxShape.circle,
            ),
          ),
          const VerticalSpace(height: TSizes.spaceBtwItems),
          const InkWell(
            child: Text(AppTexts.changeProfilePic),
          )
        ],
      ),
    );
  }
}
