import 'package:flutter/material.dart';
import 'package:voca_boom_app/core/resources/colors_manager.dart';
import 'package:voca_boom_app/core/resources/height_manager.dart';
import 'package:voca_boom_app/core/widgets/Image.dart';
import 'package:voca_boom_app/core/widgets/app_logo_widget.dart';
import 'package:voca_boom_app/views/quiz.dart';
import 'package:voca_boom_app/views/student.dart';
import 'package:voca_boom_app/views/upload_video.dart';

import '../core/resources/border_radius_manager.dart';
import '../core/resources/font_manager.dart';
import '../core/resources/utils.dart';
import '../core/resources/width_manager.dart';

class TeacherPage extends StatelessWidget {
  const TeacherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Utils.kVocaBoom,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryPurple = ColorsManager.blueColor;
    const Color secondaryBluePurple = ColorsManager.primaryColor;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [primaryPurple, secondaryBluePurple],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding:  EdgeInsets.all(HeightManager.h20),
                child: Row(
                  children: [
                    Container(
                      width:WidthManager.w60,
                      height: HeightManager.h60,
                      decoration: BoxDecoration(
                        color: ColorsManager.whiteColor,
                        borderRadius: BorderRadius.circular(BorderRadiusManager.br15),
                        boxShadow: [
                          BoxShadow(
                            color: ColorsManager.blackColor.withOpacity(0.2),
                            spreadRadius: BorderRadiusManager.br2,
                            blurRadius: BorderRadiusManager.br5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: AppLogoWidget(),
                      ),
                    ),
                    SizedBox(width: WidthManager.w15),
                    Text(
                      Utils.kVocaBoom,
                      style: TextStyle(
                        fontSize: FontSizeManger.f28,
                        fontWeight: FontWeight.bold,
                        color: ColorsManager.whiteColor,
                      ),
                    ),
                  ],
                ),
              ),

              // Content Box
              Expanded(
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: WidthManager.w20),
                  padding:  EdgeInsets.symmetric(horizontal: WidthManager.w20, vertical: HeightManager.h20),
                  decoration: BoxDecoration(
                    color: ColorsManager.whiteColor,
                    borderRadius: BorderRadius.circular(BorderRadiusManager.br30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Utils.kHelloTeacher,
                        style: TextStyle(
                          fontSize: FontSizeManger.f26,
                          fontWeight: FontWeight.bold,
                          color: ColorsManager.black87Color,
                        ),
                      ),
                      SizedBox(height: HeightManager.h10),
                      Text(
                        Utils.kchoose,
                        style: TextStyle(
                          fontSize: FontSizeManger.f22,
                          color: ColorsManager.black54Color,
                        ),
                      ),
                      SizedBox(height: HeightManager.h10),


                      Center(
                        child: Image.asset(
                          "assets/images/create quiz.png",
                          height: HeightManager.h180,
                        ),
                      ),
                      SizedBox(height: HeightManager.h10),

                      // Teacher Button
                      _buildRoleButton(
                        context: context,
                        text: Utils.kCreateQuiz,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => QuizCreatorApp())); // Add teacher navigation here
                        },
                        gradientColors: const [
                          primaryPurple,
                          secondaryBluePurple,
                        ],
                      ),
                      SizedBox(height: HeightManager.h10),

                      // Student Illustration
                      Center(
                        child: Image.asset(
                          "assets/images/upload video.png",
                          height: HeightManager.h180,
                        ),
                      ),
                      SizedBox(height: HeightManager.h10),

                      // Student Button → navigates to CourseSelectionScreen
                      _buildRoleButton(
                        context: context,
                        text: Utils.kUploadvideo,
                        onPressed: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context) => UploadVideoPage()));
                        },
                        gradientColors: const [
                          primaryPurple,
                          secondaryBluePurple,
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleButton({
    required BuildContext context,
    required String text,
    required VoidCallback onPressed,
    required List<Color> gradientColors,
  }) {
    return Container(
      width: double.infinity,
      height: HeightManager.h55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(BorderRadiusManager.br15),
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            color: ColorsManager.blackColor.withOpacity(0.2),
            spreadRadius: BorderRadiusManager.br2,
            blurRadius: BorderRadiusManager.br5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(BorderRadiusManager.br15),
          onTap: onPressed,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: ColorsManager.whiteColor,
                fontSize: FontSizeManger.f20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
