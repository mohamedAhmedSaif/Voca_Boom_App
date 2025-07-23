import 'package:flutter/material.dart';
import 'App_Colors.dart';

class AppTextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static const TextStyle label = TextStyle(
    fontSize: 16,
    color: AppColors.black,
  );

  static const TextStyle requirementValid = TextStyle(
    fontSize: 12,
    color: AppColors.green,
  );

  static const TextStyle requirementInvalid = TextStyle(
    fontSize: 12,
    color: AppColors.red,
  );
}