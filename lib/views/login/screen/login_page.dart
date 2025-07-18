import 'package:flutter/material.dart';
import 'package:voca_boom_app/core/resources/assets_values_manger.dart';
import 'package:voca_boom_app/core/resources/colors_manager.dart';
import 'package:voca_boom_app/core/resources/font_manager.dart';
import 'package:voca_boom_app/core/resources/height_manager.dart';
import 'package:voca_boom_app/core/resources/padding_manager.dart';
import 'package:voca_boom_app/core/resources/utils.dart';
import 'package:voca_boom_app/core/widgets/app_logo_widget.dart';
import 'package:voca_boom_app/core/widgets/required_field_widget.dart';
import 'package:voca_boom_app/views/sign_up/screen/sign_up_page.dart';
import '../../../forget.dart';
import '../../../home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formKey;
  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: PaddingManager.pw24,
          vertical: PaddingManager.ph24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: HeightManager.h50),
            AppLogoWidget(),

            Text(
              Utils.kLogin,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: FontSizeManger.f38,
                fontWeight: FontWeight.bold,
                color: ColorsManager.primaryColor,
                fontFamily: FontFamilyName.otamaFontFamily,
              ),
            ),

            SizedBox(height: HeightManager.h30),
            Form(
              key: formKey,
              child: Column(
                children: [
                  RequiredFieldWidget(
                    visible: true,
                    title: Utils.kEmail,
                    keyboardType: TextInputType.emailAddress,
                    hintText: Utils.kEnterYourEmail,
                    controller: emailController,
                    validator: (value) {
                      if (value == null) {
                        return 'Please enter some text';
                      } else if (value.trim().isEmpty) {
                        return 'Please enter some text';
                      } else if (value.trim().length < 3) {
                        return 'Please enter at least 3 characters';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: HeightManager.h16),
                  RequiredFieldWidget(
                    visible: isPasswordVisible,
                    title: Utils.kPassword,
                    keyboardType: TextInputType.visiblePassword,
                    hintText: Utils.kEnterYourPassword,
                    controller: passwordController,
                    validator: (value) {
                      if (value == null) {
                        return 'Please enter some text';
                      } else if (value.trim().isEmpty) {
                        return 'Please enter some text';
                      } else if (value.trim().length < 3) {
                        return 'Please enter at least 3 characters';
                      } else {
                        return null;
                      }
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: HeightManager.h61),
            // زر تسجيل الدخول
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                  (route) => true,
                );
                // if (formKey.currentState!.validate()) {
                //   //print("email: ${emailController.text}");
                // } else {
                //   print("not valid");
                // }

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF673AB7),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Log In',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            // زر نسيان كلمة المرور
            Align(
              alignment: Alignment.centerRight,
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgotPasswordPage(),
                    ),                  (route) => true,

                  );
                },

                child: const Text(
                  'Forgot Password',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 170),

            // رابط التسجيل
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Don't have an account? ",
                  style: TextStyle(color: Colors.black54),
                ),
                MaterialButton(
                  onPressed: () {
                     Navigator.pushAndRemoveUntil(
                       context,
                       MaterialPageRoute(builder: (context) => SignUpPage()),
                         (route) => true,
                     );
                  },

                  child: const Text(
                    'Sign Up Now',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
