import 'package:flutter/material.dart';
import 'package:voca_boom_app/core/resources/border_radius_manager.dart';
import 'package:voca_boom_app/core/resources/font_manager.dart';
import 'package:voca_boom_app/core/resources/padding_manager.dart';

import '../resources/colors_manager.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.hintText,
    required this.keyboardType,
    this.controller,
    this.validator,
    this.visible = true, this.suffixIcon, this.onChanged,
  });

  final String? hintText;

  final TextInputType keyboardType;
  final TextEditingController? controller;
  final FormFieldValidator<String?>? validator;
  final bool visible;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      obscuringCharacter: "*",
      obscureText: !visible,
      validator: validator,

      controller: controller,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: FontSizeManger.f12,
          fontFamily: FontFamilyName.poppinsFontFamily,
          color: ColorsManager.greyColor,
        ),
        border: _borderStyle(ColorsManager.lightGreyColor),
        focusedBorder: _borderStyle(ColorsManager.primaryColor),
        enabledBorder: _borderStyle(ColorsManager.lightGreyColor),
        errorBorder: _borderStyle(ColorsManager.redColor),
        filled: true,
        fillColor: ColorsManager.lightGreyColor,
        contentPadding: EdgeInsets.symmetric(
          vertical: PaddingManager.ph15,
          horizontal: PaddingManager.pw20,
        ),
      ),
      keyboardType: keyboardType,
    );
  }

  OutlineInputBorder _borderStyle(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(BorderRadiusManager.br10),
      borderSide: BorderSide(color: color),
    );
  }
}
