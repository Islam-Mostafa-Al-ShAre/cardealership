import 'package:cardealership/controllers/profile_controller.dart';
import 'package:cardealership/utils/constants/sizes.dart';
import 'package:cardealership/views/global_widgets/custom_spaces.dart';
import 'package:cardealership/views/pages/profile_screen/widgets/single_user_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable, camel_case_types
class personalInfoProfileSection extends StatelessWidget {
  personalInfoProfileSection({
    super.key,
  });

  ProfileController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Personal Information",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const VerticalSpace(height: TSizes.spaceBtwItems),
        Obx(() {
          return SingleUserProfileIfo(
            title: "User Id",
            value: controller.user.value.id.substring(0, 20),
          );
        }),
        const VerticalSpace(height: TSizes.sm),
        Obx(() {
          return SingleUserProfileIfo(
            title: "E-mail",
            value: controller.user.value.email,
          );
        }),
        Obx(() {
          return SingleUserProfileIfo(
            title: "Phone number",
            value: controller.user.value.phoneNumber,
          );
        }),
      ],
    );
  }
}
