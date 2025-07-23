import 'package:flutter/material.dart';
import 'package:voca_boom_app/core/widgets/app_Elevated_button.dart';

import '../../views/Reset_Password.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child:AppElevatedButton(title: "Confirm", onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => CreateNewPasswordPage()));}),
    );
  }
}