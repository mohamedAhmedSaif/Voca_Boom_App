import 'package:flutter/material.dart';

import '../../forget.dart';
import '../resources/border_radius_manager.dart';
import '../resources/colors_manager.dart';
import '../resources/font_manager.dart';
import '../resources/height_manager.dart';
import '../resources/utils.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({super.key, required this.title, this.onPressed});

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(HeightManager.h44),
        backgroundColor: ColorsManager.primaryColor,
        padding: EdgeInsets.symmetric(vertical: HeightManager.h11),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(BorderRadiusManager.br5),
        ),
        elevation: 0,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: FontSizeManger.f14,
          color: ColorsManager.whiteColor,
          fontWeight: FontWeight.bold,
          fontFamily: FontFamilyName.poppinsFontFamily,
        ),
      ),
    );
  }
}
