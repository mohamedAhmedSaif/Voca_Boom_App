import 'package:flutter/material.dart';
import 'package:voca_boom_app/core/resources/colors_manager.dart';
import 'package:voca_boom_app/views/Teacher_Page.dart';



class Confirm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SuccessPage(),
    );
  }
}

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primaryColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 5)),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'confirm',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.primaryColor,
                  ),
                ),
                SizedBox(height: 20),
                Icon(
                  Icons.check_circle,
                  size: 80,
                  color: Colors.green,
                ),
                SizedBox(height: 20),
                Text(
                  'Successful 1',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'You upload successfully',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'thanks you to learning with us',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => TeacherPage()), (route) => false); // Add your action here (e.g. navigate to another screen)
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsManager.primaryColor,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'continue learning',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}