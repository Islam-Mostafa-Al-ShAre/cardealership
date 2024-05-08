import 'package:cardealership/controllers/profile_controller.dart';
import 'package:cardealership/utils/constants/sizes.dart';
import 'package:cardealership/utils/constants/text_strings.dart';
import 'package:cardealership/utils/helpers/helper_functions.dart';
import 'package:cardealership/views/global_widgets/custom_appbar.dart';
import 'package:cardealership/views/global_widgets/custom_divider.dart';
import 'package:cardealership/views/global_widgets/custom_spaces.dart';
import 'package:cardealership/views/pages/profile_screen/widgets/personal_info_section.dart';
import 'package:cardealership/views/pages/profile_screen/widgets/profile_ifo_section.dart';
import 'package:cardealership/views/pages/profile_screen/widgets/profile_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  ProfileController profileController =
      Get.put(ProfileController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    bool isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const CustomAppBar(title: "Profile", hasCartIcon: true),
      body: SingleChildScrollView(
        child: Container(
          height: THelperFunctions.screenHeight(),
          width: double.infinity,
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileImage(isDark: isDark),
              const VerticalSpace(height: TSizes.spaceBtwSections),
              const CustomDivider(),
              const VerticalSpace(height: TSizes.spaceBtwSections),
              ProfileInfoSection(),
              const VerticalSpace(height: TSizes.spaceBtwSections),
              const CustomDivider(),
              const VerticalSpace(height: TSizes.spaceBtwSections),
              personalInfoProfileSection(),
              const VerticalSpace(height: TSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () {
                      final auth = FirebaseAuth.instance;
                      auth.signOut();
                      Get.offAllNamed(AppTexts.loginPage);
                    },
                    child: const Text(
                      "Sign Out",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: TSizes.md),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
