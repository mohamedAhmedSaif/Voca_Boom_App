import 'package:flutter/material.dart';


import '../login.dart';
import '../views/sign_up/screen/sign_up_page.dart'   ;
class VocaBoomApp extends StatelessWidget {
  const VocaBoomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

