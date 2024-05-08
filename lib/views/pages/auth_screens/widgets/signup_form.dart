import 'package:cardealership/controllers/signup_controller.dart';
import 'package:cardealership/utils/validators/validation.dart';
import 'package:cardealership/views/global_widgets/custom_text_form.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required this.signUpController,
  });

  final SignUpController signUpController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: signUpController.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  validator: (value) =>
                      TValidator.validateIfEmpty("First Name", value),
                  controller: signUpController.firstNameController,
                  hintText: "Firstname",
                  keyboardType: TextInputType.name,
                  fillColor: Colors.white10,
                  borderColor: Colors.white,
                  hintColor: Colors.white,
                  prefixIcon: Icons.person,
                  radius: 30,
                  prefixIconColor: Colors.white,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: CustomTextFormField(
                  validator: (value) =>
                      TValidator.validateIfEmpty("Last Name", value),
                  controller: signUpController.lastNameController,
                  hintText: "Lastname",
                  keyboardType: TextInputType.name,
                  fillColor: Colors.white10,
                  borderColor: Colors.white,
                  hintColor: Colors.white,
                  prefixIcon: Icons.person,
                  radius: 30,
                  prefixIconColor: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            validator: (value) => TValidator.validateEmail(value),
            controller: signUpController.emailController,
            hintText: "Email",
            keyboardType: TextInputType.emailAddress,
            fillColor: Colors.white10,
            borderColor: Colors.white,
            hintColor: Colors.white,
            prefixIcon: Icons.email,
            radius: 30,
            prefixIconColor: Colors.white,
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            validator: (value) => TValidator.validatePassword(value),
            controller: signUpController.passwordController,
            hintText: "Password",
            keyboardType: TextInputType.visiblePassword,
            fillColor: Colors.white10,
            borderColor: Colors.white,
            hintColor: Colors.white,
            isPassword: true,
            radius: 30,
            suffixIconColor: Colors.white,
            prefixIcon: Icons.password,
            prefixIconColor: Colors.white,
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            validator: (value) => TValidator.validatePhoneNumber(value),
            controller: signUpController.phoneNumberController,
            hintText: "Phone Number",
            keyboardType: TextInputType.visiblePassword,
            fillColor: Colors.white10,
            borderColor: Colors.white,
            hintColor: Colors.white,
            isPassword: false,
            radius: 30,
            suffixIconColor: Colors.white,
            prefixIcon: Icons.password,
            prefixIconColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
