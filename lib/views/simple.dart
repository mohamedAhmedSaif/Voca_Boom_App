// simple_sentences_page.dart
import 'package:flutter/material.dart';
import 'package:voca_boom_app/core/resources/assets_values_manger.dart';
import 'package:voca_boom_app/core/resources/utils.dart';
import 'package:voca_boom_app/core/widgets/app_logo_widget.dart';

import '../core/resources/border_radius_manager.dart';
import '../core/resources/colors_manager.dart';
import '../core/resources/font_manager.dart';
import '../core/resources/height_manager.dart';
import '../core/resources/width_manager.dart';

class SimpleSentencesPage extends StatelessWidget {
  const SimpleSentencesPage({super.key});

  // تعريف الألوان بناءً على التصميم الذي قدمته
  static const Color _primaryPurple = ColorsManager.blueColor; // لون التدرج العلوي للخلفية
  static const Color _secondaryBlue = ColorsManager.lightBlu2eColor; // لون التدرج السفلي للخلفية
  static const Color _greenButton = ColorsManager.lightGreenColor; // لون زر "I" و "She"
  static const Color _orangeButton = ColorsManager.lightOrangeColor; // لون زر "You", "Go", "Eat"
  static const Color _blueButton = ColorsManager.lightbluColor;   // لون زر "play", "Run"
  static const Color _listItemBg = ColorsManager.black45Color; // خلفية عناصر القائمة الشفافة

  // تدرج زر "Try Quiz" السفلي
  static const Color _buttonGradientStart = ColorsManager.blueColor;
  static const Color _buttonGradientEnd = ColorsManager.lightBlu2eColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient( // تدرج لوني للخلفية
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [_primaryPurple, _secondaryBlue],
          ),
        ),
        child: SafeArea( // يضمن أن المحتوى لا يتداخل مع أجزاء نظام التشغيل (مثل شريط الحالة)
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // محاذاة المحتوى للبداية (اليسار)
            children: [
              // --- الشريط العلوي (زر الرجوع، الشعار، أيقونة الصوت) ---
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: WidthManager.w20, vertical: HeightManager.h10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // توزيع العناصر بالتساوي مع مسافة بينها
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: FontSizeManger.f28), // أيقونة الرجوع
                      onPressed: () {
                        Navigator.pop(context); // للعودة للصفحة السابقة
                      },
                    ),
                    // شعار VocaBoom (تفترض وجود assets/vocaboom_logo_full.png)
                    // إذا لم يكن لديك هذا الشعار، يمكنك إزالته أو استبداله بنص
                    Image.asset(AssetsValuesManger.logo,height: HeightManager.h70,width: WidthManager.w60,),
                    IconButton(
                      icon:  Icon(Icons.volume_up, color: Colors.white, size: FontSizeManger.f28), // أيقونة الصوت
                      onPressed: () {
                        print(Utils.kSoundIcon); // طباعة للتحقق، يمكن إضافة وظيفة تشغيل الصوت
                      },
                    ),
                  ],
                ),
              ),
               SizedBox(height: HeightManager.h10), // مسافة بعد الشريط العلوي

              // --- عنوان "Simple Sentences" ---
               Padding(
                padding: EdgeInsets.symmetric(horizontal: WidthManager.w24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Utils.kSimpleSentences,
                      style: TextStyle(
                        fontSize: FontSizeManger.f28,
                        fontWeight: FontWeight.bold,
                        color: ColorsManager.whiteColor,
                      ),
                    ),
                    Text(
                      Utils.kSpeakUnderstand,
                      style: TextStyle(
                        fontSize: FontSizeManger.f18,
                        color: ColorsManager.white70Color,
                      ),
                    ),
                  ],
                ),
              ),
               SizedBox(height: HeightManager.h24),

              // --- الكلمات التفاعلية/الأزرار (Wrap للمرونة في التخطيط) ---
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: WidthManager.w20),
                child: Wrap( // Wrap widget يسمح للعناصر بالالتفاف إلى السطر التالي إذا لم يكن هناك مساحة كافية
                  spacing: 10.0, // المسافة الأفقية بين الأزرار
                  runSpacing: 10.0, // المسافة الرأسية بين الصفوف
                  children: [
                    _buildWordButton('I', _greenButton), //
                    _buildWordButton('You', _orangeButton), //
                    _buildWordButton('play', _blueButton), //
                    _buildWordButton('Go', _orangeButton), //
                    _buildWordButton('Eat', _orangeButton), //
                    _buildWordButton('She', _greenButton), //
                    _buildWordButton('Run', _blueButton), //
                    _buildWordButton('Run', _blueButton), //
                  ],
                ),
              ),
              const SizedBox(height: 25),

              // --- قائمة الجمل مع الصور الرمزية ---
              Expanded(
                child: ListView.builder(
                  padding:  EdgeInsets.symmetric(horizontal: WidthManager.w20),
                  itemCount: 3, // حسب تصميمك، هناك ثلاثة عناصر "I am happy"
                  itemBuilder: (context, index) {
                    String phrase;
                    // لتغيير الجملة الثالثة إلى "I am eating" كما في التصميم
                    if (index == 2) {
                      phrase = 'I am eating';
                    } else {
                      phrase = 'I am happy';
                    }
                    return _buildPhraseListItem(
                        context, phrase, 'assets/person_avatar.png'); // استبدل بمسار الصورة الرمزية الخاصة بك
                  },
                ),
              ),
               SizedBox(height: HeightManager.h20),

              // --- قسم "Try a Situation" ---
               Padding(
                padding: EdgeInsets.symmetric(horizontal: WidthManager.w20),
                child: Text(
                  Utils.kTryASituation,
                  style: TextStyle(
                    fontSize: FontSizeManger.f22,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.whiteColor,
                  ),
                ),
              ),
               SizedBox(height: HeightManager.h20),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: WidthManager.w20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // توزيع الأزرار بالتساوي
                  children: [
                    _buildSituationButton(context, 'Order\nfood', Icons.fastfood, _orangeButton), //
                    _buildSituationButton(context, 'Ask for\nthe Bus', Icons.directions_bus, _blueButton), //
                    _buildSituationButton(context, 'Talk about\nHobbies', Icons.music_note, _greenButton), //
                  ],
                ),
              ),
               SizedBox(height: HeightManager.h30),

              // --- زر "Try Quiz" (في الأسفل) ---
              Padding(
                padding:  EdgeInsets.all(HeightManager.h20),
                child: Container(
                  width: double.infinity,
                  height: HeightManager.h60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(BorderRadiusManager.br15),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [_buttonGradientStart, _buttonGradientEnd],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(BorderRadiusManager.br15),
                      onTap: () {
                        print(Utils.kTryQuizButton); // طباعة للتحقق
                        // قم بتطبيق منطق التنقل إلى صفحة الاختبار هنا.
                      },
                      child:  Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.quiz_outlined, color: ColorsManager.whiteColor, size: FontSizeManger.f28),
                            SizedBox(width: WidthManager.w10),
                            Text(
                              Utils.kTryQuiz,
                              style: TextStyle(
                                color: ColorsManager.whiteColor,
                                fontSize: FontSizeManger.f20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- دوال مساعدة (Widgets للتحكم) ---

  // دالة مساعدة لبناء أزرار الكلمات التفاعلية (مثل "I", "You", "play")
  Widget _buildWordButton(String text, Color color) {
    return ElevatedButton( // ElevatedButton هو زر Material Design
      onPressed: () {
        print('Word "$text" pressed!'); // طباعة عند الضغط
        // هنا يمكنك إضافة منطق لتشغيل صوت الكلمة أو إضافتها إلى بناء جملة.
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color, // لون خلفية الزر
        foregroundColor: ColorsManager.whiteColor, // لون النص
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(BorderRadiusManager.br10), // حواف دائرية
        ),
        padding: EdgeInsets.symmetric(horizontal: WidthManager.w20, vertical: HeightManager.h10), // حشوة داخلية
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: FontSizeManger.f18, fontWeight: FontWeight.bold),
      ),
    );
  }

  // دالة مساعدة لبناء عناصر قائمة الجمل (مثل "I am happy")
  Widget _buildPhraseListItem(BuildContext context, String phrase, String avatarPath) {
    return Container( // حاوية لعنصر القائمة الفردي
      margin: const EdgeInsets.only(bottom: 15), // مسافة سفلية بين العناصر
      padding:  EdgeInsets.symmetric(vertical: HeightManager.h10, horizontal: WidthManager.w15), // حشوة داخلية
      decoration: BoxDecoration(
        color: _listItemBg, // خلفية داكنة شبه شفافة
        borderRadius: BorderRadius.circular(BorderRadiusManager.br15), // حواف دائرية
      ),
      child: Row( // صف لتنظيم عناصر داخل العنصر
        children: [
          Icon(Icons.check_circle_outline, color: Colors.greenAccent, size: FontSizeManger.f28), // أيقونة صح
          SizedBox(width: WidthManager.w15),
          Expanded( // Expanded لتمكين النص من أخذ المساحة المتاحة
            child: Text(
              phrase,
              style:  TextStyle(color: ColorsManager.whiteColor, fontSize: FontSizeManger.f18),
            ),
          ),
           SizedBox(width: WidthManager.w10),
          CircleAvatar( // صورة رمزية دائرية
            radius: 20,
            backgroundImage: AssetImage(avatarPath), // مسار الصورة الرمزية
            backgroundColor: Colors.grey, // لون خلفية احتياطي
          ),
           SizedBox(width: WidthManager.w5),
          Icon(Icons.volume_up, color: Colors.white, size: FontSizeManger.f24), // أيقونة مكبر الصوت
        ],
      ),
    );
  }

  // دالة مساعدة لبناء أزرار المواقف (مثل "Order food")
  Widget _buildSituationButton(BuildContext context, String text, IconData icon, Color color) {
    return Expanded( // Expanded يجعل الزر يأخذ جزءًا متساوياً من المساحة في الصف
      child: Container(
        margin:  EdgeInsets.symmetric(horizontal: WidthManager.w10), // مسافة أفقية صغيرة
        height: HeightManager.h100, // ارتفاع ثابت
        decoration: BoxDecoration(
          color: color, // لون خلفية الزر
          borderRadius: BorderRadius.circular(BorderRadiusManager.br15), // حواف دائرية
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell( // InkWell لتأثير النقر
            borderRadius: BorderRadius.circular(BorderRadiusManager.br15),
            onTap: () {
              print('Situation "$text" pressed!'); // طباعة عند الضغط
              // هنا يمكنك إضافة منطق خاص بالموقف المحدد (مثل فتح شاشة جديدة).
            },
            child: Column( // عمود لتنظيم الأيقونة والنص
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: ColorsManager.whiteColor, size: FontSizeManger.f32), // أيقونة الموقف
                 SizedBox(height: HeightManager.h5),
                Text(
                  text,
                  textAlign: TextAlign.center, // توسيط النص إذا كان متعدد الأسطر
                  style:  TextStyle(color: ColorsManager.whiteColor, fontSize: FontSizeManger.f16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}