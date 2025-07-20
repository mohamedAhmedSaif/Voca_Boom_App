
import 'package:flutter/material.dart';

import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/font_manager.dart' show FontSizeManger, FontFamilyName;
import '../../../core/resources/utils.dart';

class TitleLoginPage extends StatelessWidget {
  const TitleLoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      Utils.kLogIn,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: FontSizeManger.f38,
        fontWeight: FontWeight.bold,
        color: ColorsManager.primaryColor,
        fontFamily: FontFamilyName.otamaFontFamily,
      ),
    );
  }
}
