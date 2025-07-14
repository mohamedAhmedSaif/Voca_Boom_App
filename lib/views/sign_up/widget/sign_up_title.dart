import 'package:flutter/material.dart';

import '../../../core/resources/utils.dart';

class SignUpTitle extends StatelessWidget {
  const SignUpTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return
      const Text(
        Utils.kSignUp,
        style: TextStyle(
          fontSize: 32,//TODO make font size manager
          fontWeight: FontWeight.bold,
          color: Color(0xFF6A1B9A),//TODO put in color manager
        ),
      );
  }
}
