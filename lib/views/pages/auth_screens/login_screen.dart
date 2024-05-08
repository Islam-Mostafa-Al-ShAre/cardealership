import 'package:cardealership/controllers/login_controller.dart';
import 'package:cardealership/helpers/my_var.dart';
import 'package:cardealership/utils/constants/colors.dart';
import 'package:cardealership/utils/helpers/helper_functions.dart';
import 'package:cardealership/utils/validators/validation.dart';
import 'package:cardealership/views/global_widgets/custom_spaces.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../global_widgets/app_progress_button.dart';
import '../../global_widgets/custom_text_form.dart';
import '../../global_widgets/social_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/images/pexels-kamshotthat-3457780.jpg",
            ),
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: loginController.loginFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(30),
                  Row(
                    children: [
                      Text("CAR ZONE",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .apply(color: TColors.white)),
                      horizontalSpace(12),
                      const Icon(
                        FontAwesomeIcons.hand,
                        color: Colors.yellow,
                      )
                    ],
                  ),
                  verticalSpace(50),
                  Text(
                    "Welcome to CarZone ",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .apply(color: TColors.white),
                  ),
                  verticalSpace(50),
                  CustomTextFormField(
                    validator: (text) =>
                        TValidator.validateIfEmpty("Email", text),
                    controller: loginController.emailController,
                    hintText: "Email",
                    keyboardType: TextInputType.emailAddress,
                    fillColor: Colors.white10,
                    borderColor: whiteColor,
                    hintColor: whiteColor,
                    prefixIcon: Icons.email,
                    radius: 30,
                    prefixIconColor: whiteColor,
                  ),
                  const VerticalSpace(
                    height: 30,
                  ),
                  CustomTextFormField(
                    validator: (text) =>
                        TValidator.validateIfEmpty("password", text),
                    controller: loginController.passwordController,
                    hintText: "Password",
                    keyboardType: TextInputType.visiblePassword,
                    fillColor: Colors.white10,
                    borderColor: whiteColor,
                    hintColor: whiteColor,
                    isPassword: true,
                    radius: 30,
                    suffixIconColor: whiteColor,
                    prefixIcon: Icons.password,
                    prefixIconColor: whiteColor,
                  ),
                  verticalSpace(50),
                  Center(
                    child: AppProgressButton(
                        width: THelperFunctions.screenWidth(),
                        isBordered: false,
                        backgroundColor:
                            THelperFunctions.isDarkMode(Get.context!)
                                ? TColors.primary
                                : TColors.secondary,
                        height: 55,
                        text: "LOGIN",
                        fontSize: 18,
                        radius: 30,
                        onPressed: (animationController) {
                          loginController.emailAndPasswordLogin();
                        }),
                  ),
                  verticalSpace(80),
                  const Center(
                    child: Text(
                      "------ Or -------",
                      style: TextStyle(
                        color: whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  verticalSpace(50),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SocialButton(
                        backGroundColor: whiteColor,
                        icon: FontAwesomeIcons.facebook,
                        iconColor: Colors.blue,
                      ),
                      SocialButton(
                        backGroundColor: whiteColor,
                        icon: FontAwesomeIcons.google,
                        iconColor: Colors.red,
                      ),
                      SocialButton(
                        backGroundColor: whiteColor,
                        icon: FontAwesomeIcons.twitter,
                        iconColor: Colors.blue,
                      ),
                      SocialButton(
                        backGroundColor: whiteColor,
                        icon: FontAwesomeIcons.tiktok,
                      )
                    ],
                  ),
                  verticalSpace(50),
                  GestureDetector(
                    onTap: () {
                      Get.offNamed(REGISTER);
                    },
                    child: const Center(
                      child: Text(
                        "Don' thave an account? Signup",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
