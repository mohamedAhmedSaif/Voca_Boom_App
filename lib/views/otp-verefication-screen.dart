import 'package:flutter/material.dart';
import 'package:voca_boom_app/core/resources/utils.dart';

import '../core/resources/colors_manager.dart';
import '../core/resources/font_manager.dart';
import '../core/resources/height_manager.dart';
import '../core/resources/width_manager.dart';
import '../core/widgets/Confirm_botun.dart';
import '../core/widgets/Otp_input_field.dart';

class OTPVerificationScreen extends StatelessWidget {
  const OTPVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(HeightManager.h20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Arrow & Cancel
              Row(
                children: [
                  IconButton(
                    color: Colors.indigo,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios_new),
                  ),
                  SizedBox(height: HeightManager.h16),
                  Text(
                    Utils.kCancel,
                    style: TextStyle(
                      color: Colors.indigo,
                      fontSize: FontSizeManger.f20,
                      fontWeight: FontWeight.bold,
                      fontFamily: FontFamilyName.otamaFontFamily,
                    ),
                  ),
                ],
              ),

              SizedBox(height: HeightManager.h16),

              /// Title
              Text(
                Utils.kOtpVerification,
                style: TextStyle(
                  color: Colors.indigo,
                  fontSize: FontSizeManger.f20,
                  fontWeight: FontWeight.bold,
                  fontFamily: FontFamilyName.otamaFontFamily,
                ),
              ),

              SizedBox(height: HeightManager.h6),

              /// Subtext
              Text(
                Utils.kPleaseEnterYour4DigitCode,
                style: TextStyle(
                  color: ColorsManager.greyColor,
                  fontSize: FontSizeManger.f16,
                ),
              ),

              SizedBox(height: HeightManager.h55),

              /// OTP Boxes
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OTPInputField(),
                  OTPInputField(),
                  OTPInputField(),
                  OTPInputField(),
                  OTPInputField(),
                ],
              ),

              SizedBox(height: HeightManager.h40),

              /// Confirm Button
              const ConfirmButton(),

              SizedBox(height: HeightManager.h6),

              /// Resend Timer
              Center(
                child: Text(
                  Utils.kResendCode,
                  style: TextStyle(
                    color: ColorsManager.greyColor,
                    fontSize: FontSizeManger.f12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
