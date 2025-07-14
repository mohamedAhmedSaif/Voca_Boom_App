import 'package:flutter/material.dart';

import '../resources/assets_values_manger.dart';
import '../resources/height_manager.dart';
import '../resources/width_manager.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetsValuesManger.logo,
      height: HeightManager.h124,
      width: WidthManager.w124,
      fit: BoxFit.contain,
    );
  }
}
