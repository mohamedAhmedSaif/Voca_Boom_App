import 'package:flutter/material.dart';
import 'package:voca_boom_app/core/widgets/app_Elevated_button.dart';
import 'package:voca_boom_app/core/widgets/app_text_field.dart';
import 'package:voca_boom_app/views/student.dart';

import '../core/resources/colors_manager.dart';
import '../core/resources/font_manager.dart';
import '../core/resources/height_manager.dart';
import 'home.dart';

class ConfirmPaymentPage extends StatelessWidget {
  const ConfirmPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [SizedBox(height: 65),
               Text(
                "confirm payment",
                style: TextStyle(
                  fontSize: FontSizeManger.f24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                  fontFamily: FontFamilyName. poppinsFontFamily,
                ),
              ),
              const SizedBox(height: 56),
              Icon(
                Icons.check,
                color: Colors.deepPurple,
                size: FontSizeManger.f100,
              ),
               SizedBox(height: HeightManager.h55),
               Text(
                "Successful 1",
                style: TextStyle(
                  fontSize: FontSizeManger.f24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: FontFamilyName. poppinsFontFamily,
                ),
              ),
               SizedBox(height: HeightManager.h36),
              Text(
                "you order number is #253479\n"
                    "you will receive the order\n"
                    "confirm email shorty",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: FontSizeManger.f20,fontFamily: FontFamilyName. poppinsFontFamily,),
              ),
              SizedBox(height: HeightManager.h81),
               Text(
                "thanks you to learning with us",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: FontSizeManger.f20,fontFamily: FontFamilyName. poppinsFontFamily,),
              ),
               SizedBox(height: HeightManager.h55),
AppElevatedButton(title: "Continue Learning", onPressed: (){Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => StudentApp()), (route) => false);})            ],
          ),
        ),
      ),
    );
  }
}
