import 'package:flutter/material.dart';
import 'package:voca_boom_app/core/resources/assets_values_manger.dart';
import 'package:voca_boom_app/core/resources/colors_manager.dart';
import 'package:voca_boom_app/core/resources/width_manager.dart';
import 'package:voca_boom_app/core/widgets/app_logo_widget.dart';
import 'package:voca_boom_app/views/sign_up/widget/sign_up_title.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/padding_manager.dart';
import '../../../core/resources/utils.dart';
import '../../../login.dart';

// 👇 استيراد صفحة Home (تأكد من المسار الصحيح)
import '../../../home.dart'; // غيّر المسار لو موجود في مكان تاني

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.whiteColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: PaddingManager.p24,
          vertical: PaddingManager.p60,
        ),
        child: Column(
          children: [
            Image.asset("assets/images/logo.png", height: 100, width: 100),
            const SizedBox(height: HeightManager.h40),
            SignUpTitle(),
            const SizedBox(height: HeightManager.h40),

            _buildTextField(
              hintText: 'Enter Your First Name',
              labelText: 'First Name',
            ),
            const SizedBox(height: HeightManager.h20),
            _buildTextField(
              hintText: 'Enter Your Last Name',
              labelText: 'Last Name',
            ),
            const SizedBox(height: HeightManager.h20),
            _buildTextField(
              hintText: 'Enter your email address',
              labelText: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: HeightManager.h20),
            _buildTextField(
              hintText: 'Enter Your Phone',
              labelText: 'Phone',
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: HeightManager.h20),

            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: '*********',
                labelText: 'Password',
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: const Icon(Icons.visibility_off, color: Colors.grey),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 20.0,
                ),
              ),
            ),
            const SizedBox(height: HeightManager.h10),

            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Please add all necessary characters to create safe password.',
                    style: TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(height: HeightManager.h5),
                  _buildRequirementRow('One uppercase character.'),
                  _buildRequirementRow('One lowercase character.'),
                  _buildRequirementRow('One special character.'),
                  _buildRequirementRow('One number.'),
                ],
              ),
            ),
            const SizedBox(height: HeightManager.h20),

            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: '*********',
                labelText: 'Confirm Password',
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: const Icon(Icons.visibility_off, color: Colors.grey),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 20.0,
                ),
              ),
            ),
            const SizedBox(height: HeightManager.h30),

            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Upload image For Your Profile',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: HeightManager.h10),

            Container(
              height: HeightManager.h150,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!, width: 1.5),
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[50],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.cloud_upload, size: 50, color: Colors.grey),
                  const SizedBox(height: HeightManager.h8),
                  const Text(
                    'Select file',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: HeightManager.h30),

            // ✅ زر التسجيل مع التنقل
            ElevatedButton(
              onPressed: () {
                // انتقال مباشر إلى صفحة Home
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4a29dc),
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'Sign Up',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Have an account already?",
                  style: TextStyle(color: Colors.black54),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  },
                  child: const Text(
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
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 20.0,
        ),
      ),
      keyboardType: keyboardType,
    );
  }

  Widget _buildRequirementRow(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          Icon(Icons.circle, size: 8, color: Colors.green[700]),
          const SizedBox(width: 8.0),
          Text(text, style: const TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }
}
