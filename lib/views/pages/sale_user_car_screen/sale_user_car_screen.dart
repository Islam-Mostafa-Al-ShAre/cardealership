import 'package:cardealership/utils/constants/sizes.dart';
import 'package:cardealership/views/global_widgets/custom_appbar.dart';
import 'package:cardealership/views/global_widgets/custom_button.dart';
import 'package:cardealership/views/global_widgets/custom_divider.dart';
import 'package:cardealership/views/global_widgets/custom_spaces.dart';
import 'package:cardealership/views/global_widgets/custom_text_form.dart';
import 'package:flutter/material.dart';

class SaleUserCarScreen extends StatelessWidget {
  const SaleUserCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Sale Car",
        hasCartIcon: false,
      ),
      body: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const VerticalSpace(height: TSizes.appBarHeight),
                const CustomTextFormField(
                    hintText: "Car Name", keyboardType: TextInputType.name),
                const VerticalSpace(height: TSizes.spaceBtwItems),
                const CustomTextFormField(
                    hintText: "Car Discreption",
                    keyboardType: TextInputType.multiline),
                const VerticalSpace(height: TSizes.spaceBtwItems),
                const CustomTextFormField(
                    hintText: "Price", keyboardType: TextInputType.number),
                const VerticalSpace(height: TSizes.spaceBtwItems),
                const CustomTextFormField(
                    hintText: "Phone Number",
                    keyboardType: TextInputType.phone),
                const VerticalSpace(height: TSizes.spaceBtwItems),
                const CustomTextFormField(
                    hintText: "CarImage", keyboardType: TextInputType.name),
                const VerticalSpace(height: 50),
                const CustomDivider(),
                const VerticalSpace(height: 80),
                CostomButton(
                  OnPressed: () {},
                  text: "Upload",
                  width: double.infinity,
                )
              ],
            ),
          )),
    );
  }
}
