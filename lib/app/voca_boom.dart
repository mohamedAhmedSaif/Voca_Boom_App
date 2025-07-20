import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voca_boom_app/core/resources/colors_manager.dart';
import 'package:voca_boom_app/letter_page.dart';
import 'package:voca_boom_app/payment_method_page.dart';


import '../views/login/screen/login_page.dart';
class VocaBoomApp extends StatelessWidget {
  const VocaBoomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
                home:LoginPage(),
                theme: ThemeData(
                  scaffoldBackgroundColor: ColorsManager.whiteColor
                ),
        );
      },
    );
  }
}

