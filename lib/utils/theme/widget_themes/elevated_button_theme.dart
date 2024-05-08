import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/* -- Light & Dark Elevated Button Themes -- */
class TElevatedButtonTheme {
  TElevatedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: TColors.light,
      backgroundColor: TColors.secondary,
      disabledForegroundColor: TColors.darkGrey,
      disabledBackgroundColor: TColors.buttonDisabled,
      padding: const EdgeInsets.symmetric(vertical: TSizes.buttonHeight),
      textStyle: const TextStyle(
          fontSize: TSizes.fontSizeMd,
          color: TColors.textWhite,
          fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(TSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: TColors.light,
      backgroundColor: TColors.primary,
      disabledForegroundColor: TColors.darkGrey,
      disabledBackgroundColor: TColors.darkerGrey,
      padding: const EdgeInsets.symmetric(vertical: TSizes.buttonHeight),
      textStyle: const TextStyle(
          fontSize: TSizes.fontSizeMd,
          color: TColors.textWhite,
          fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(TSizes.buttonRadius)),
    ),
  );
}
