import 'package:flutter/material.dart';

void main() {
  runApp(const student());
}

class student extends StatelessWidget {
  const student({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hide the debug banner
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
    // Define colors from your design
    const Color primaryBlue = Color(0xFF334EFF); // Dominant blue for cards
    const Color accentPurple = Color(0xFF6A4CEE); // Button background
    const Color secondaryBlue = Color(0xFF4C9EEE); // For background gradient

    // Dummy data for courses
    final List<Map<String, dynamic>> courses = [
      {'icon': Icons.book_outlined, 'name': 'Course 1', 'price': 'Free'},
      {'icon': Icons.mic_outlined, 'name': 'Course 2', 'price': 'Free'},
      {'icon': Icons.menu_book_sharp, 'name': 'Course 3', 'price': '50.0 pounds'},
      {'icon': Icons.account_balance_wallet_outlined, 'name': 'Course 4', 'price': '70.0 pounds'},
      {'icon': Icons.book, 'name': 'Course 5', 'price': '70.5 pounds'},
      {'icon': Icons.chat_bubble_outline, 'name': 'Course 6', 'price': '79.5 pounds'},
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF6A4CEE), // Top gradient color (slightly purplish)
              Color(0xFF4C9EEE), // Bottom gradient color (bluish)
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Top App Bar Area (Logo, Title, etc.) ---
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/logo.png', // Replace with your combined logo asset
                        height: 80, // Adjust height as needed
                      ),
                    ),
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
              const SizedBox(height: 20), // Space before the list

              // --- Course List (The main controls) ---
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

  // Helper method to build each course list item
  Widget _buildCourseListItem({
    required BuildContext context,
    required IconData icon,
    required String courseName,
    required String price,
    required Color primaryBlue,
    required Color accentPurple,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15), // Space between items
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
        color: primaryBlue, // The distinct blue color for each card
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3), // Adds a subtle shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 30), // Course icon
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
          // --- Action Button (Free / Buy Now) ---
          ElevatedButton(
            onPressed: () {
              // Action based on price
              if (price == 'Free') {
                print('$courseName - Free Course Selected!');
                // Implement navigation or course activation for free courses
              } else {
                print('$courseName - Buy Now for $price!');
                // Implement payment flow for paid courses
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: accentPurple, // Button background color
              foregroundColor: Colors.white, // Text color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Rounded button corners
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              minimumSize: const Size(0, 40), // Ensure button has a min height
            ),
            child: Text(
              price == 'Free' ? 'Free' : 'Buy Now',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (price != 'Free') ...[
            const SizedBox(width: 5), // Space between button and price
            Text(
              price,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ],
      ),
    );
  }
}