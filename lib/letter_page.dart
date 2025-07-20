import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:voca_boom_app/core/resources/assets_values_manger.dart';
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

  Future _speak(String text) async {
    await flutterTts.stop();
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);

    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.blackBlueColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          Utils.kLearnTheLetters,
          style: TextStyle(
            color: ColorsManager.whiteColor,
            fontSize: FontSizeManger.f22,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: HeightManager.h8),
              itemCount: Utils.letters.length,
              itemBuilder: (context, index) {
                final letterData = Utils.letters[index];
                final isSelected = index == selectedIndex;

                return GestureDetector(
                  onTap: () async {
                    setState(() {
                      selectedIndex = index;
                    });
                    _speak('${letterData['letter']}  ${letterData["word"]}');

                    // await Future.delayed(const Duration(seconds: 1));
                    // _speak(
                    //   '${letterData['word'].split('').join('                ')}',
                    // );
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(
                      horizontal: WidthManager.w16,
                      vertical: HeightManager.h8,
                    ),
                    padding: EdgeInsets.all(WidthManager.w16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        BorderRadiusManager.br20,
                      ),
                      gradient: LinearGradient(
                        colors:
                            isSelected
                                ? [
                                  ColorsManager.primaryColor,
                                  ColorsManager.purpleColor,
                                ]
                                : [
                                  ColorsManager.lightBlueColor,
                                  ColorsManager.primaryColor,
                                ],
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
                          letterData['letter'] + letterData['letterSmall'],
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
            padding: EdgeInsets.symmetric(
              horizontal: WidthManager.w24,
              vertical: HeightManager.h16,
            ),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  print(Utils.kTryQuizpressed);
                  // يمكنك التنقل لصفحة الكويز هنا
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.primaryColor,
                  padding: EdgeInsets.symmetric(vertical: WidthManager.w16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      BorderRadiusManager.br30,
                    ),
                  ),
                ),
                child: Text(
                  Utils.kTryQuiz,
                  style: TextStyle(
                    fontSize: FontSizeManger.f18,
                    color: ColorsManager.whiteColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
