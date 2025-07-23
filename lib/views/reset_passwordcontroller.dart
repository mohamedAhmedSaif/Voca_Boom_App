import 'package:flutter/material.dart';
import 'package:voca_boom_app/controller/login_page_controller.dart';
import 'package:voca_boom_app/core/resources/height_manager.dart';
import 'package:voca_boom_app/core/resources/padding_manager.dart';
import 'package:voca_boom_app/core/resources/utils.dart';
import 'package:voca_boom_app/core/widgets/app_logo_widget.dart';
import 'package:voca_boom_app/core/widgets/app_Elevated_button.dart';
import 'package:voca_boom_app/core/widgets/required_field_widget.dart';
import '../../../core/fun/regex_exp.dart';
import 'login/widgets/custom_bottom_nav_bar_login_page.dart';
import 'login/widgets/title_login_page.dart';


class ResettwoPage extends StatefulWidget {
  const ResettwoPage({super.key});

  @override
  State<ResettwoPage> createState() => _ResettwoPageState();
}

class _ResettwoPageState extends State<ResettwoPage> {
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
    return Column(
                  children: [
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
                      title: Utils.kConfirmPassword,
                      keyboardType: TextInputType.visiblePassword,
                      hintText: Utils.kEnterNewPassword,
                      controller: controller.passwordController,
                      validator: RegexExpressions.validatorPassword,
                    ),
                  ],
                );
  }
}
