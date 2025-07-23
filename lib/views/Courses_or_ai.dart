import 'package:flutter/material.dart';
import 'package:voca_boom_app/views/student.dart';

import '../core/resources/border_radius_manager.dart';
import '../core/resources/colors_manager.dart';
import '../core/resources/height_manager.dart';
import '../core/resources/width_manager.dart';
import '../core/widgets/app_Elevated_button.dart';
import '../core/widgets/app_logo_widget.dart';
import 'ai.dart';

class CoursesOrAi extends StatelessWidget {
  const CoursesOrAi({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student App',
      home: const StudentPage(),
    );
  }
}

// الصفحة الأولى: Hello Student
class StudentPage extends StatelessWidget {
  const StudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F2AA9),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [SizedBox(height: HeightManager.h40)
,              const Text(
                "Hello Student",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5A3BEF),
                ),
              ),
               SizedBox(height: HeightManager.h27),
              const Text("Choose :"),
               SizedBox(height: HeightManager.h16),
              Center(child: Image.asset("assets/images/corses.png", height: 150)), // صورة تعليمية
               SizedBox(height: HeightManager.h30),
AppElevatedButton(title: 'Go to Courses',onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => StudentApp()));},),
              SizedBox(height: HeightManager.h55),
              Image.asset("assets/images/ai.png", height: 150), // صورة AI
              SizedBox(height: HeightManager.h30),
              AppElevatedButton(title: 'Learn by AI',onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HelloInAIPage()));},),
            ],
          ),
        ),
      ),
    );
  }
}