import 'package:flutter/material.dart';
import 'package:voca_boom_app/views/sign_up/screen/sign_up_page.dart';

import '../core/resources/utils.dart';
import '../views/forget.dart';
import '../views/home.dart';

class LoginPageController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formKey;
  bool isPasswordVisible = false;
  final BuildContext context;

  bool visiblePassword = false;

  LoginPageController(this.context) {
    init();
  }

  void init() {
    initControllers();
  }

  void dispose() {
    disposeControllers();
  }

  void initControllers() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  void disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
  }

  void onPressedLoginButton() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => Home()),
      (route) => false,
    );
  }

  /// Navigate to forgot password page and remove all previous routes
  ///
  /// This function is used when the user presses on the "Forget Password" text
  void onPressedAtForgetPasswordText() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const ForgotPasswordPage()),
      (route) => true,
    );
  }

  /// Validator for email field
  ///
  /// This function is used to validate the email text field in the login page.
  /// It checks if the value is null, empty or has less than 3 characters.
  /// If the value is not valid, it returns an error message.
  /// If the value is valid, it returns null.

  /// Validator for password field
  ///
  /// This function is used to validate the password text field in the login page.
  /// It checks if the value is null, empty or has less than 3 characters.
  /// If the value is not valid, it returns an error message.
  /// If the value is valid, it returns null.
  ///
  /// [value] the value of the text field to be validated
  ///

  /// Validator for password field
  ///
  /// This function is used to validate the password text field in the login page.
  /// It checks if the value is null, empty or has less than 3 characters.
  /// If the value is not valid, it returns an error message.
  /// If the value is valid, it returns null.
  ///
  /// [value] the value of the text field to be validated
  ///
  /// Returns null if the value is valid, otherwise returns an error message.

  /// Navigate to sign up page and remove all previous routes
  ///
  /// This function is used when the user presses on the "Sign Up" text
  /// at the bottom of the login page.
  void onTapAtSignUpNowText() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => SignUpPage()),
      (route) => true,
    );
  }

  void onTapAtAyeVisiblePassword() {
    visiblePassword = !visiblePassword;
  }
}
