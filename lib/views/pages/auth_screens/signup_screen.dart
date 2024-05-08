import 'package:cardealership/controllers/signup_controller.dart';
import 'package:cardealership/helpers/my_var.dart';
import 'package:cardealership/utils/constants/colors.dart';
import 'package:cardealership/utils/helpers/helper_functions.dart';
import 'package:cardealership/views/pages/auth_screens/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../global_widgets/app_progress_button.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final SignUpController signUpController = Get.put(SignUpController());
  @override
  build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const Row(
                  children: [
                    Text(
                      "CAR ZONE",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(width: 12),
                    Icon(
                      FontAwesomeIcons.hands,
                      color: Colors.yellow,
                    )
                  ],
                ),
                const SizedBox(height: 50),
                const Text(
                  "REGISTER",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 50),
                //sing up inputes
                SignUpForm(signUpController: signUpController),
                const SizedBox(height: 30),
                Center(
                  child: AppProgressButton(
                    width: MediaQuery.of(context).size.width,
                    isBordered: false,
                    backgroundColor: THelperFunctions.isDarkMode(Get.context!)
                        ? TColors.primary
                        : TColors.secondary,
                    height: 55,
                    text: "REGISTER",
                    fontSize: 18,
                    radius: 30,
                    onPressed: (animationController) {
                      animationController.forward();
                      Future.delayed(
                        const Duration(seconds: 1),
                        () {
                          animationController.reverse();

                          signUpController.signUp();
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    Get.offNamed(LOGIN);
                  },
                  child: const Center(
                    child: Text(
                      "Don' thave an account? Login",
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
    );
  }
}
