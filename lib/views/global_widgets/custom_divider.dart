import 'package:cardealership/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        width: double.infinity,
        child: Divider(
          height: .5,
          color: TColors.darkGrey,
          thickness: 1,
        ));
  }
}
