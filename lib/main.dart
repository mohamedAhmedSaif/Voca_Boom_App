import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voca_boom_app/core/resources/colors_manager.dart';

import 'app/voca_boom.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // status bar color (top)
      statusBarIconBrightness: Brightness.dark, // icon color (white or black)
      systemNavigationBarColor: Colors.red, // navigation bar color (bottom)
      systemNavigationBarIconBrightness: Brightness.light, // nav icon color
    ),
  );
  runApp(VocaBoomApp());
}
