import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:voca_boom_app/core/resources/utils.dart';

import 'core/resources/border_radius_manager.dart';
import 'core/resources/colors_manager.dart';
import 'core/resources/font_manager.dart';
import 'core/resources/height_manager.dart';
import 'core/resources/height_manager.dart';
import 'core/resources/width_manager.dart';

class LettersPage extends StatefulWidget {
  const LettersPage({super.key});

  @override
  State<LettersPage> createState() => _LettersPageState();
}

class _LettersPageState extends State<LettersPage> {
  int selectedIndex = -1;
  final FlutterTts flutterTts = FlutterTts();

  final List<Map<String, dynamic>> letters = [
    {'letter': 'A','word': 'Apple', 'icon': Icons.apple},
    {'letter': 'B', 'word': 'Ball', 'icon': Icons.sports_baseball},
    {'letter': 'C', 'word': 'Car', 'icon': Icons.directions_car},
    {'letter': 'D', 'word': 'Duck', 'icon': Icons.toys},
    {'letter': 'Ee', 'word': 'Egg', 'icon': Icons.egg},
    {'letter': 'F', 'word': 'Fish', 'icon': Icons.set_meal},
    {'letter': 'G', 'word': 'Girl', 'icon': Icons.face},
    {'letter': 'H', 'word': 'Horse', 'icon': Icons.pets},
    {'letter': 'I', 'word': 'Ice Cream', 'icon': Icons.icecream},
    {'letter': 'J', 'word': 'Jar', 'icon': Icons.coffee},
    {'letter': 'K', 'word': 'Key', 'icon': Icons.vpn_key},
    {'letter': 'L', 'word': 'Light', 'icon': Icons.lightbulb},
    {'letter': 'M', 'word': 'Moon', 'icon': Icons.brightness_2},
    {'letter': 'N', 'word': 'Nose', 'icon': Icons.sick},
    {'letter': 'O', 'word': 'Octopus', 'icon': Icons.bubble_chart},
    {'letter': 'P', 'word': 'Pencil', 'icon': Icons.edit},
    {'letter': 'Q', 'word': 'Queen', 'icon': Icons.emoji_people},
    {'letter': 'R', 'word': 'Rocket', 'icon': Icons.rocket_launch},
    {'letter': 'S', 'word': 'Star', 'icon': Icons.star},
    {'letter': 'T', 'word': 'Tree', 'icon': Icons.park},
    {'letter': 'U', 'word': 'Umbrella', 'icon': Icons.umbrella},
    {'letter': 'V', 'word': 'Volcano', 'icon': Icons.terrain},
    {'letter': 'W', 'word': 'Worm', 'icon': Icons.settings_input_component},
    {'letter': 'X', 'word': 'Xylophone', 'icon': Icons.music_note},
    {'letter': 'Y', 'word': 'Yoyo', 'icon': Icons.toys},
    {'letter': 'Z', 'word': 'Zebra', 'icon': Icons.agriculture},
  ];

  Future _speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  ColorsManager.blackblueColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          Utils.kLearnTheLetters,
          style: TextStyle(color: ColorsManager.whiteColor, fontSize: FontSizeManger.f22),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: HeightManager.h8),
              itemCount: letters.length,
              itemBuilder: (context, index) {
                final letterData = letters[index];
                final isSelected = index == selectedIndex;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                    _speak(letterData['letter'] + letterData["word"]);


                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin:  EdgeInsets.symmetric(horizontal: WidthManager.w16, vertical: HeightManager.h8),
                    padding:  EdgeInsets.all(WidthManager.w16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(BorderRadiusManager.br20),
                      gradient: LinearGradient(
                        colors: isSelected
                            ? [ColorsManager.primaryColor, ColorsManager.burpleColor]
                            : [ColorsManager.lightblueColor, ColorsManager.primaryColor],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        if (isSelected)
                          BoxShadow(
                            color: ColorsManager.black26Color,
                            blurRadius: BorderRadiusManager.br10,
                            offset: const Offset(0, 4),
                          ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Text(
                          letterData['letter'],
                          style: TextStyle(
                            fontSize: FontSizeManger.f26,
                            color: ColorsManager.whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: WidthManager.w20),
                        Icon(
                          letterData['icon'],
                          color: ColorsManager.blackColor,
                          size: FontSizeManger.f28,
                        ),
                        const Spacer(),
                        Text(
                          letterData['word'],
                          style: TextStyle(
                            fontSize: FontSizeManger.f16,
                            color: ColorsManager.white70Color,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: WidthManager.w24, vertical: HeightManager.h16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  print(Utils.kTryQuizpressed);
                  // يمكنك التنقل لصفحة الكويز هنا
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.primaryColor,
                  padding:  EdgeInsets.symmetric(vertical: WidthManager.w16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(BorderRadiusManager.br30),
                  ),
                ),
                child: Text(
                 Utils.kTryQuiz,
                  style: TextStyle(fontSize: FontSizeManger.f18, color: ColorsManager.whiteColor),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
