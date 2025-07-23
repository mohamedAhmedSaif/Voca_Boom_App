import 'package:flutter/material.dart';

class OTPInputField extends StatelessWidget {
  const OTPInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: const InputDecoration(
          counterText: '',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}