import 'package:flutter/material.dart';
import 'package:voca_boom_app/views/student.dart';

import '../core/resources/height_manager.dart';
import '../core/widgets/app_Elevated_button.dart';
import 'aicity.dart';
class HelloInAIPage extends StatelessWidget {
  const HelloInAIPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D4293), // الخلفية زرقاء
      body: SafeArea(
        child: Column(
          children: [
            // زر الرجوع
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),

            // محتوى الصفحة
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45),
                      bottomLeft: Radius.circular(45),
                      bottomRight: Radius.circular(45),
                    ),
                  ),
                  child: Padding(padding: const EdgeInsets.all(8.0), child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: HeightManager.h20),
                      const Text(
                        'Hello in AI',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0D4293),
                        ),
                      ),
                      SizedBox(height: HeightManager.h20),
                      const Text(
                        'Choose Your environment:',
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                      SizedBox(height: HeightManager.h30),

                      // خيار "City"
                      Center(child: Image.asset("assets/images/city.png")),
                      AppElevatedButton(title: 'City',onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => AiCity()));},),

                      const SizedBox(height: 20),
                      // خيار "Village"
                      Center(child: Image.asset('assets/images/village.png')),
                      AppElevatedButton(title: 'Village',onPressed: (){},),

                      const SizedBox(height: 20),
                      // خيار "Desert"
                      Center(child: Image.asset('assets/images/desert.png')),
                      AppElevatedButton(title: 'Desert',onPressed: (){},),
                    ],
                  ), ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildEnvCard(String imagePath, String label) {
    return ElevatedButton(
      onPressed: () {
        // action
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF5A2EFF),
        minimumSize: const Size.fromHeight(60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            height: 50,
            width: 50,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 20),
          Text(
            label,
            style: const TextStyle(fontSize: 18),
          ),
        ],),
      );
  }
}
