class Validators {
  static bool hasMinLength(String password) => password.length >= 12;
  static bool hasUppercase(String password) => password.contains(RegExp(r'[A-Z]'));
  static bool hasLowercase(String password) => password.contains(RegExp(r'[a-z]'));
  static bool hasSpecialChar(String password) => password.contains(RegExp(r'[!@#\$&*~]'));
  static bool hasNumber(String password) => password.contains(RegExp(r'[0-9]'));
}