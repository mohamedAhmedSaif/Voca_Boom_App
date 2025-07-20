import 'package:flutter/material.dart';

import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/font_manager.dart';
import '../../../core/resources/utils.dart';

class CustomForgetPasswordLoginPage extends StatelessWidget {
  const CustomForgetPasswordLoginPage({super.key, required this.onTapAtForgetPasswordText});

  final GestureTapCallback onTapAtForgetPasswordText;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: onTapAtForgetPasswordText,
        child: Text(
          Utils.kForgetPassword,
          style: TextStyle(
            fontSize: FontSizeManger.f10,
            color: ColorsManager.darkBlueColor,
            fontFamily: FontFamilyName.poppinsFontFamily,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
