import 'package:flutter/material.dart';

import '../core/resources/utils.dart';

class SignUpPageController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController phoneController;
  late GlobalKey<FormState> formKey;
  bool visiblePassword = false;
  bool visibleConfirmPassword = false;

  SignUpPageController() {
    init();
  }

  void init() {
    initControllers();
  }

  void initControllers() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    phoneController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  void disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
  }

  void dispose() {
    disposeControllers();
  }

  void onTapAtAyeVisiblePassword() {
    visiblePassword = !visiblePassword;
  }

  void onTapAtAyeConfirmVisiblePassword() {
    visibleConfirmPassword = !visibleConfirmPassword;
  }

  void onChangedPassword(String value) {
    changeValidate(int index, bool value) {
      Utils.listRequiredPasswordFieldModel[index].validate = value;
    }

    if (value.length >= 12) {
      changeValidate(0, true);
    } else {
      changeValidate(0, false);
    }
    if (RegExp(r"[A-Z]").hasMatch(value)) {
      changeValidate(1, true);
    } else {
      changeValidate(1, false);
    }
    if (RegExp(r"[a-z]").hasMatch(value)) {
      changeValidate(2, true);
    } else {
      changeValidate(2, false);
    }
    if (RegExp(r"\d").hasMatch(value)) {
      changeValidate(3, true);
    } else {
      changeValidate(3, false);
    }
    if (RegExp(r"\W").hasMatch(value)) {
      changeValidate(4, true);
    } else {
      changeValidate(4, false);
    }
  }
}
