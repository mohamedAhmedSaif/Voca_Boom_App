import 'package:flutter/material.dart';
import 'package:voca_boom_app/core/resources/font_manager.dart';
import 'package:voca_boom_app/core/resources/utils.dart';

import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/padding_manager.dart';
import '../../../core/resources/width_manager.dart';

class CustomBottomNavBarLoginPage extends StatelessWidget {
  const CustomBottomNavBarLoginPage({super.key, required this.onTapAtSignUpNowText});

  final GestureTapCallback onTapAtSignUpNowText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: PaddingManager.ph17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            Utils.kDonHaveAnAccount,
            style: TextStyle(
              color: ColorsManager.grey2Color,
              fontSize: FontSizeManger.f14,
              fontFamily: FontFamilyName.poppinsFontFamily,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: WidthManager.w5),
          InkWell(
            onTap: onTapAtSignUpNowText,

            child: Text(
              Utils.kSignUpNow,
              style: TextStyle(
                fontSize: FontSizeManger.f14,
                color: ColorsManager.darkBlueColor,
                fontWeight: FontWeight.w600,
                decorationColor: ColorsManager.darkBlueColor,
                decorationThickness: 1.5,
                decoration: TextDecoration.underline,
                fontFamily: FontFamilyName.poppinsFontFamily,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
