import '../resources/utils.dart';

class RegexExpressions {
  RegexExpressions._();

  static String? validatorPhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your phone number';
    } else if (_isPhoneValid(value)) {
      return 'Please enter a valid phone number';
    } else {
      return null;
    }
  }

  static bool _isPhoneValid(String phone) {
    RegExp phoneRegex = RegExp(r'^(010|011|012|015)\d{8}$');
    return phoneRegex.hasMatch(phone);
  }

  static String? validatorEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email'; //TODO :: move to utils manager
    } else if (_isEmailValid(value) == false) {
      return 'Please enter a valid email'; //TODO :: move to utils manager
    } else {
      return null;
    }
  }

  static bool _isEmailValid(String email) {
    RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  static String? validatorPassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return Utils.kPleaseEnterSomeText;
    } else if (_isPasswordValid(value) == false) {
      return Utils.kPleaseEnterAtLeast8Characters;
    } else {
      return null;
    }
  }

  static bool _isPasswordValid(String password) {
    RegExp passwordRegex = RegExp(r'^.{8,}$');
    return passwordRegex.hasMatch(password);
  }
}
