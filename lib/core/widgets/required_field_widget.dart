import 'package:flutter/material.dart';

import '../resources/colors_manager.dart';
import '../resources/font_manager.dart';
import '../resources/height_manager.dart';
import 'app_text_field.dart';

class RequiredFieldWidget extends StatelessWidget {
  const RequiredFieldWidget({
    super.key,
    required this.title,
    required this.keyboardType,
    required this.hintText,
    required this.controller,
    this.validator,
    required this.visible,
  });

  final String title;
  final TextInputType keyboardType;
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator<String?>? validator;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: FontFamilyName.poppinsFontFamily,
            fontSize: FontSizeManger.f16,
            color: ColorsManager.darkGreyColor,
          ),
        ),
        SizedBox(height: HeightManager.h6),

        AppTextField(
          keyboardType: keyboardType,
          hintText: hintText,
          visible: visible,
          controller: controller,
          validator: validator,
        ),
      ],
    );
  }
}
