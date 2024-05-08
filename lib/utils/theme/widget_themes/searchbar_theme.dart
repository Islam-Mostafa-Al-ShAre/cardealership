import 'package:cardealership/utils/constants/colors.dart';
import 'package:cardealership/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TSearchBarTheme {
  static SearchBarThemeData lightSearchBarTheme = const SearchBarThemeData(
    backgroundColor: MaterialStatePropertyAll(TColors.light),
    elevation: MaterialStatePropertyAll(0),
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(TSizes.borderRadiusSm),
        ),
      ),
    ),
  );
  static SearchBarThemeData darkSearchBarTheme = const SearchBarThemeData(
    backgroundColor: MaterialStatePropertyAll(TColors.dark),
    elevation: MaterialStatePropertyAll(0),
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(TSizes.borderRadiusSm),
        ),
      ),
    ),
  );
}
