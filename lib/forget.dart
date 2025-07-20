import 'package:flutter/material.dart';

import 'core/resources/border_radius_manager.dart';
import 'core/resources/colors_manager.dart';
import 'core/resources/font_manager.dart';
import 'core/resources/height_manager.dart';
import 'core/resources/utils.dart';
import 'core/resources/width_manager.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF6A1B9A)),
          onPressed: () {
            Navigator.pop(context); // يرجع لـ Login
          },
        ),
        title: Text(
          Utils.kBack,
          style: TextStyle(color: ColorsManager.primaryColor, fontSize: FontSizeManger.f24),
        ),
        centerTitle: false,
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        padding:  EdgeInsets.symmetric(horizontal: WidthManager.w24, vertical: HeightManager.h20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Utils.kForgetPassword,
              style: TextStyle(
                fontSize: FontSizeManger.f24,
                fontWeight: FontWeight.bold,
                color:  ColorsManager.primaryColor,
              ),
            ),
             SizedBox(height: HeightManager.h10),
             Text(
             Utils.kPleaseEnterEmail,
              style: TextStyle(fontSize: FontSizeManger.f16, color: ColorsManager.black54Color),
            ),
             SizedBox(height: HeightManager.h90),
            TextField(
              decoration: InputDecoration(
                hintText:Utils.kEnterEmail,
                labelText: Utils.kEmail,
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(BorderRadiusManager.br10),
                  borderSide: BorderSide.none,
                ),
                contentPadding:  EdgeInsets.symmetric(
                  vertical: WidthManager.w15,
                  horizontal: HeightManager.h20,
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
             SizedBox(height: HeightManager.h130),
            ElevatedButton(
              onPressed: () {
                // Send code logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:  ColorsManager.primaryColor,
                padding:  EdgeInsets.symmetric(vertical: HeightManager.h15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(BorderRadiusManager.br10),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child:  Text(
              Utils.kSendCode,
                style: TextStyle(fontSize: FontSizeManger.f18, color: ColorsManager.whiteColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
