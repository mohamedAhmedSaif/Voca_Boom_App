import 'package:flutter/material.dart';
import 'package:voca_boom_app/core/widgets/app_logo_widget.dart';
import 'package:voca_boom_app/views/Courses_or_ai.dart';
import 'package:voca_boom_app/views/letter_page.dart';
import 'package:voca_boom_app/views/simple.dart';


import '../core/resources/colors_manager.dart';
import 'payment_method_page.dart';


class StudentApp extends StatelessWidget {
  const StudentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'VocaBoom Courses',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const CourseSelectionScreen(),
    );
  }
}

class CourseSelectionScreen extends StatelessWidget {
  const CourseSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Color(0xFF334EFF);
    const Color accentPurple = Color(0xFF6A4CEE);

    final List<Map<String, dynamic>> courses = [
      {'icon': Icons.book_outlined, 'name': 'Course 1', 'price': 'Free'},
      {'icon': Icons.mic_outlined, 'name': 'Course 2', 'price': 'Free'},
      {'icon': Icons.menu_book_sharp, 'name': 'Course 3', 'price': '1000.0 pounds'},
      {'icon': Icons.account_balance_wallet_outlined, 'name': 'Course 4', 'price': '1500.0 pounds'},
      {'icon': Icons.book, 'name': 'Course 5', 'price': '1200.5 pounds'},
      {'icon': Icons.chat_bubble_outline, 'name': 'Course 6', 'price': '2000.5 pounds'},
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF6A4CEE),
              Color(0xFF4C9EEE),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [

                   Align(alignment: Alignment.bottomLeft,
                     child: IconButton(
                                     icon: const Icon(Icons.arrow_back, color: ColorsManager.blackColor),
                                     onPressed: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => CoursesOrAi()), (route) => false)
                                   ),
                   )
                 ,
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Center(
                        child:AppLogoWidget()),
                    const SizedBox(height: 20),
                    const Text(
                      'Choose Your Course',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    final course = courses[index];
                    return _buildCourseListItem(
                      context: context,
                      icon: course['icon'],
                      courseName: course['name'],
                      price: course['price'],
                      primaryBlue: primaryBlue,
                      accentPurple: accentPurple,
                      index: index,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCourseListItem({
    required BuildContext context,
    required IconData icon,
    required String courseName,
    required String price,
    required Color primaryBlue,
    required Color accentPurple,
    required int index,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
        color: primaryBlue,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 30),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              courseName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {
              if (price == 'Free') {
                if (index == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => LettersPage()),
                  );
                } else if (index == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SimpleSentencesPage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('$courseName opened!')),
                  );
                }
              } else {
                // ✅ فتح صفحة الدفع
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PaymentMethodPage()),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: accentPurple,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              price == 'Free' ? 'Free' : 'Buy Now',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          if (price != 'Free') ...[
            const SizedBox(width: 5),
            Text(
              price,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ],
      ),
    );
  }
}
