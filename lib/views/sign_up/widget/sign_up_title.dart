import 'package:flutter/material.dart';

import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/font_manager.dart';
import '../../../core/resources/utils.dart';

class SignUpTitle extends StatelessWidget {
  const SignUpTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return
       Text(
        Utils.kJoinUs,
        style: TextStyle(
          fontSize: FontSizeManger.f38,
          fontWeight: FontWeight.bold,
          color: ColorsManager.primaryColor,
          fontFamily: FontFamilyName.otamaFontFamily,
        ),
      );
  }
}
