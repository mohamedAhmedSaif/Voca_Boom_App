import 'package:flutter/material.dart';
import 'package:voca_boom_app/core/resources/utils.dart';
import 'package:voca_boom_app/views/home.dart';

import '../core/resources/border_radius_manager.dart';
import '../core/resources/colors_manager.dart';
import '../core/resources/font_manager.dart';
import '../core/resources/height_manager.dart';
import '../core/resources/width_manager.dart';
import '../core/widgets/app_Elevated_button.dart';

class CreateNewPasswordPage extends StatefulWidget {
  const CreateNewPasswordPage({super.key});

  @override
  State<CreateNewPasswordPage> createState() => _CreateNewPasswordPageState();
}

class _CreateNewPasswordPageState extends State<CreateNewPasswordPage> {
  bool _obscurePassword = true;
  bool _obscureConfirm = true;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  String get password => _passwordController.text;

  bool get isLongEnough => password.length >= 12;
  bool get hasUpperCase => password.contains(RegExp(r'[A-Z]'));
  bool get hasLowerCase => password.contains(RegExp(r'[a-z]'));
  bool get hasNumber => password.contains(RegExp(r'[0-9]'));
  bool get hasSpecialChar => password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: ColorsManager.primaryColor),
        backgroundColor: ColorsManager.whiteColor,
        elevation: 0,
        title: const Text(
          Utils.kCancel,
          style: TextStyle(color: ColorsManager.primaryColor),
        ),
      ),
      backgroundColor: ColorsManager.whiteColor,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: WidthManager.w24, vertical: HeightManager.h10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  Utils.kCreateNewPassword,
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: FontSizeManger.f22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 SizedBox(height: HeightManager.h24),
                const Text(Utils.kNewPassword),
                 SizedBox(height: HeightManager.h8),
                TextField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  onChanged: (_) => setState(() {}),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                      onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular( BorderRadiusManager.br12),
                    ),
                    filled: true,
                    fillColor:  ColorsManager.whiteColor,
                  ),
                ),
                 SizedBox(height: HeightManager.h8),
                if (!(isLongEnough && hasUpperCase && hasLowerCase && hasSpecialChar && hasNumber))
                  const Text(
                    Utils.kPleaseAddAllNecessaryCharacters,
                    style: TextStyle(color: ColorsManager.redColor),
                  ),
                 SizedBox(height: HeightManager.h6),
                _buildRequirement(Utils.kMinimumCharacters, isLongEnough),
                _buildRequirement(Utils.kOneluppercaseCharacter, hasUpperCase),
                _buildRequirement(Utils.kOnelowercaseCharacter, hasLowerCase),
                _buildRequirement(Utils.kOneSpecialCharacter, hasSpecialChar),
                _buildRequirement(Utils.kOneNumber, hasNumber),
                 SizedBox(height: HeightManager.h24),
                const Text(Utils.kConfirmPassword),
                 SizedBox(height: HeightManager.h8),
                TextField(
                  controller: _confirmController,
                  obscureText: _obscureConfirm,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(_obscureConfirm ? Icons.visibility_off : Icons.visibility),
                      onPressed: () => setState(() => _obscureConfirm = !_obscureConfirm),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(BorderRadiusManager.br12),
                    ),
                    filled: true,
                    fillColor:  ColorsManager.whiteColor,
                  ),
                ),
                 SizedBox(height: HeightManager.h30),
                SizedBox(
                  width: double.infinity,
                  child: AppElevatedButton(title: Utils.kConfirm, onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));}),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRequirement(String text, bool condition) {
    return Row(
      children: [
        Icon(Icons.circle, size: FontSizeManger.f10, color: condition ? ColorsManager.lightGreenColor : ColorsManager.greyColor),
         SizedBox(width: WidthManager.w8),
        Text(
          text,
          style: TextStyle(
            color: condition ? ColorsManager.lightGreenColor : ColorsManager.greyColor,
            fontSize: FontSizeManger.f14,
          ),
        ),
      ],
    );
  }
}
