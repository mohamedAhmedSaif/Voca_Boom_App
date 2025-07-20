import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:voca_boom_app/core/resources/assets_values_manger.dart';
import 'package:voca_boom_app/core/resources/border_radius_manager.dart';
import 'package:voca_boom_app/core/resources/colors_manager.dart';
import 'package:voca_boom_app/core/resources/width_manager.dart';
import 'package:voca_boom_app/core/widgets/app_Elevated_button.dart';
import 'package:voca_boom_app/core/widgets/app_logo_widget.dart';
import 'package:voca_boom_app/core/widgets/required_field_widget.dart';
import 'package:voca_boom_app/views/sign_up/widget/sign_up_title.dart';
import '../../../controller/sign_up_page_controller.dart';
import '../../../core/fun/regex_exp.dart';
import '../../../core/resources/font_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/padding_manager.dart';
import '../../../core/resources/utils.dart';
import '../../login/screen/login_page.dart';

// 👇 استيراد صفحة Home (تأكد من المسار الصحيح)
import '../../../home.dart'; // غيّر المسار لو موجود في مكان تاني

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late SignUpPageController controller;

  @override
  void initState() {
    controller = SignUpPageController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: PaddingManager.pw24),
          child: Column(
            children: [
              AppLogoWidget(),
              SignUpTitle(),
              RequiredFieldWidget(
                title: Utils.kFirstName,
                keyboardType: TextInputType.name,
                hintText: Utils.kEnterYourFirstName,
                controller:
                    controller.firstNameController, //Todo: add controller
              ),
              SizedBox(height: HeightManager.h16),
              RequiredFieldWidget(
                title: Utils.kLastName,
                keyboardType: TextInputType.name,
                hintText: Utils.kEnterYourLastName,
                controller:
                    controller.lastNameController, //Todo: add controller
              ),
              SizedBox(height: HeightManager.h16),
              RequiredFieldWidget(
                title: Utils.kEmail,
                keyboardType: TextInputType.emailAddress,
                hintText: Utils.kEnterYourEmail,
                controller: controller.emailController,

                validator: RegexExpressions.validatorEmail,
              ),
              SizedBox(height: HeightManager.h16),
              RequiredFieldWidget(
                title: Utils.kPhone,
                keyboardType: TextInputType.phone,
                hintText: Utils.kEnterYourPhone,
                controller: controller.phoneController,
                validator: RegexExpressions.validatorPhone,
              ),
              SizedBox(height: HeightManager.h16),
              RequiredFieldWidget(
                onChanged: (value) {
                  controller.onChangedPassword(value);
                  setState(() {});
                },
                visible: controller.visiblePassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.onTapAtAyeVisiblePassword();
                    setState(() {});
                  },
                  icon: Icon(
                    controller.visiblePassword
                        ? Icons.visibility_off_rounded
                        : Icons.visibility_rounded,
                  ),
                ),
                title: Utils.kPassword,
                keyboardType: TextInputType.visiblePassword,
                hintText: Utils.kEnterYourPassword,
                controller: controller.passwordController,
                validator: RegexExpressions.validatorPassword,
              ),
              SizedBox(height: HeightManager.h16),
              ListView.builder(
                itemCount: Utils.listRequiredPasswordFieldModel.length,
                itemBuilder:
                    (context, index) => Text(
                      Utils.listRequiredPasswordFieldModel[index].title,
                      style: TextStyle(
                        fontSize: FontSizeManger.f9,
                        fontFamily: FontFamilyName.poppinsFontFamily,
                        decorationColor: Colors.green,
                        decoration:
                            Utils
                                        .listRequiredPasswordFieldModel[index]
                                        .validate ==
                                    true
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                        color:
                            Utils
                                        .listRequiredPasswordFieldModel[index]
                                        .validate ==
                                    true
                                ? Colors.green
                                : ColorsManager.redColor,
                      ),
                    ),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
              ),
              SizedBox(height: HeightManager.h20),
              RequiredFieldWidget(
                visible: controller.visibleConfirmPassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.onTapAtAyeConfirmVisiblePassword();
                    setState(() {});
                  },
                  icon: Icon(
                    controller.visibleConfirmPassword
                        ? Icons.visibility_off_rounded
                        : Icons.visibility_rounded,
                  ),
                ),
                title: Utils.kConfirmPassword,
                keyboardType: TextInputType.visiblePassword,
                hintText: Utils.kEnterYourConfirmPassword,
                controller: controller.confirmPasswordController,
                validator: RegexExpressions.validatorPassword,
              ),
              SizedBox(height: HeightManager.h16),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  Utils.kUploadImageForYourProfile,
                  style: TextStyle(
                    fontSize: FontSizeManger.f16,
                    fontFamily: FontFamilyName.poppinsFontFamily,
                    color: ColorsManager.darkGreyColor,
                  ),
                ),
              ),
              SizedBox(height: HeightManager.h8),

              Container(
                width: double.infinity,
                height: HeightManager.h200,
                child: DottedBorder(
                  options: RoundedRectDottedBorderOptions(
                    radius: Radius.circular(BorderRadiusManager.br10),
                    dashPattern: [10, 5],
                    strokeWidth: 2,
                    borderPadding: EdgeInsets.zero,
                    color: ColorsManager.primaryColor,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image,
                          size: HeightManager.h27,
                          color: ColorsManager.primaryColor,
                        ),
                        SizedBox(height: HeightManager.h16),
                        Text(
                          Utils.kUploadImage,
                          style: TextStyle(
                            color: Colors.blue,
                            fontFamily: FontFamilyName.poppinsFontFamily,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: HeightManager.h30),

              AppElevatedButton(title: Utils.kJoinUs, onPressed: () {Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Home()),(route) => false,)

              ;},),
              SizedBox(height: HeightManager.h6),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Have an account already?",
                    style: TextStyle(color: Colors.black54),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        color: Color(0xFF4a29dc),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ✅ عناصر المساعدة
  Widget _buildTextField({
    required String hintText,
    required String labelText,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      ),
      keyboardType: keyboardType,
    );
  }

  Widget _buildRequirementRow(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          Icon(Icons.circle, size: 8, color: Colors.green[700]),
          SizedBox(width: 8.0),
          Text(text, style: TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }
}
