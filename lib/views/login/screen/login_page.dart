import 'package:flutter/material.dart';
import 'package:voca_boom_app/controller/login_page_controller.dart';
import 'package:voca_boom_app/core/resources/height_manager.dart';
import 'package:voca_boom_app/core/resources/padding_manager.dart';
import 'package:voca_boom_app/core/resources/utils.dart';
import 'package:voca_boom_app/core/widgets/app_logo_widget.dart';
import 'package:voca_boom_app/core/widgets/app_Elevated_button.dart';
import 'package:voca_boom_app/core/widgets/required_field_widget.dart';
import '../../../core/fun/regex_exp.dart';
import '../widgets/custom_bottom_nav_bar_login_page.dart';
import '../widgets/custom_login_forget_password_login_page.dart';
import '../widgets/title_login_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginPageController controller;

  @override
  void initState() {
    super.initState();
    controller = LoginPageController(context);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBarLoginPage(
        onTapAtSignUpNowText: () {
          controller.onTapAtSignUpNowText();
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: PaddingManager.pw24,
            vertical: PaddingManager.ph24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: HeightManager.h50),
              AppLogoWidget(),
              TitleLoginPage(),
              SizedBox(height: HeightManager.h30),
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    RequiredFieldWidget(
                      title: Utils.kEmail,
                      keyboardType: TextInputType.emailAddress,
                      hintText: Utils.kEnterYourEmail,
                      controller: controller.emailController,
                      validator: RegexExpressions.validatorEmail,
                    ),
                    SizedBox(height: HeightManager.h16),
                    RequiredFieldWidget(
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
                  ],
                ),
              ),

              SizedBox(height: HeightManager.h61),
              AppElevatedButton(
                title: Utils.kLogIn,
                onPressed: controller.onPressedLoginButton,
              ),
              SizedBox(height: HeightManager.h13),
              CustomForgetPasswordLoginPage(onTapAtForgetPasswordText: () {
                controller.onPressedAtForgetPasswordText();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
