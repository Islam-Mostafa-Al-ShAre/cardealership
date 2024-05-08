import 'package:cardealership/controllers/profile_controller.dart';
import 'package:cardealership/utils/constants/sizes.dart';
import 'package:cardealership/views/global_widgets/custom_spaces.dart';
import 'package:cardealership/views/pages/profile_screen/widgets/single_user_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

// ignore: must_be_immutable
class ProfileInfoSection extends StatelessWidget {
  ProfileInfoSection({
    super.key,
  });

  ProfileController controller = ProfileController.instance;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Profile Information",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const VerticalSpace(height: TSizes.spaceBtwItems),
        Obx(() {
          return SingleUserProfileIfo(
            title: "Name",
            value: controller.user.value.fullName,
          );
        }),
        const VerticalSpace(height: TSizes.sm),
        Obx(() {
          return SingleUserProfileIfo(
            title: "User Name",
            value: controller.user.value.userName,
          );
        }),
      ],
    );
  }
}
