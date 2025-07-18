// simple_sentences_page.dart
import 'package:flutter/material.dart';

class SimpleSentencesPage extends StatelessWidget {
  const SimpleSentencesPage({super.key});

  // تعريف الألوان بناءً على التصميم الذي قدمته
  static const Color _primaryPurple = Color(0xFF6A4CEE); // لون التدرج العلوي للخلفية
  static const Color _secondaryBlue = Color(0xFF4C9EEE); // لون التدرج السفلي للخلفية
  static const Color _greenButton = Color(0xFF4CAF50); // لون زر "I" و "She"
  static const Color _orangeButton = Color(0xFFFF9800); // لون زر "You", "Go", "Eat"
  static const Color _blueButton = Color(0xFF2196F3);   // لون زر "play", "Run"
  static const Color _listItemBg = Colors.black45; // خلفية عناصر القائمة الشفافة

  // تدرج زر "Try Quiz" السفلي
  static const Color _buttonGradientStart = Color(0xFF6A4CEE);
  static const Color _buttonGradientEnd = Color(0xFF4C9EEE);

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
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // توزيع العناصر بالتساوي مع مسافة بينها
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 28), // أيقونة الرجوع
                      onPressed: () {
                        Navigator.pop(context); // للعودة للصفحة السابقة
                      },
                    ),
                    // شعار VocaBoom (تفترض وجود assets/vocaboom_logo_full.png)
                    // إذا لم يكن لديك هذا الشعار، يمكنك إزالته أو استبداله بنص
                    Image.asset(
                      'assets/images/logo.png', //
                      height: 60,
                    ),
                    IconButton(
                      icon: const Icon(Icons.volume_up, color: Colors.white, size: 28), // أيقونة الصوت
                      onPressed: () {
                        print('Sound icon pressed!'); // طباعة للتحقق، يمكن إضافة وظيفة تشغيل الصوت
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10), // مسافة بعد الشريط العلوي

              // --- عنوان "Simple Sentences" ---
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Simple Sentences',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Speak & Understand',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              // --- الكلمات التفاعلية/الأزرار (Wrap للمرونة في التخطيط) ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
              const SizedBox(height: 20),

              // --- قسم "Try a Situation" ---
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  'Try a Situation',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // توزيع الأزرار بالتساوي
                  children: [
                    _buildSituationButton(context, 'Order\nfood', Icons.fastfood, _orangeButton), //
                    _buildSituationButton(context, 'Ask for\nthe Bus', Icons.directions_bus, _blueButton), //
                    _buildSituationButton(context, 'Talk about\nHobbies', Icons.music_note, _greenButton), //
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // --- زر "Try Quiz" (في الأسفل) ---
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
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
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {
                        print('Try Quiz button pressed on Sentences Page!'); // طباعة للتحقق
                        // قم بتطبيق منطق التنقل إلى صفحة الاختبار هنا.
                      },
                      child: const Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.quiz_outlined, color: Colors.white, size: 28),
                            SizedBox(width: 10),
                            Text(
                              'Try Quiz',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
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
        foregroundColor: Colors.white, // لون النص
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // حواف دائرية
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12), // حشوة داخلية
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  // دالة مساعدة لبناء عناصر قائمة الجمل (مثل "I am happy")
  Widget _buildPhraseListItem(BuildContext context, String phrase, String avatarPath) {
    return Container( // حاوية لعنصر القائمة الفردي
      margin: const EdgeInsets.only(bottom: 15), // مسافة سفلية بين العناصر
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15), // حشوة داخلية
      decoration: BoxDecoration(
        color: _listItemBg, // خلفية داكنة شبه شفافة
        borderRadius: BorderRadius.circular(15), // حواف دائرية
      ),
      child: Row( // صف لتنظيم عناصر داخل العنصر
        children: [
          const Icon(Icons.check_circle_outline, color: Colors.greenAccent, size: 28), // أيقونة صح
          const SizedBox(width: 15),
          Expanded( // Expanded لتمكين النص من أخذ المساحة المتاحة
            child: Text(
              phrase,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          const SizedBox(width: 10),
          CircleAvatar( // صورة رمزية دائرية
            radius: 20,
            backgroundImage: AssetImage(avatarPath), // مسار الصورة الرمزية
            backgroundColor: Colors.grey, // لون خلفية احتياطي
          ),
          const SizedBox(width: 10),
          const Icon(Icons.volume_up, color: Colors.white, size: 24), // أيقونة مكبر الصوت
        ],
      ),
    );
  }

  // دالة مساعدة لبناء أزرار المواقف (مثل "Order food")
  Widget _buildSituationButton(BuildContext context, String text, IconData icon, Color color) {
    return Expanded( // Expanded يجعل الزر يأخذ جزءًا متساوياً من المساحة في الصف
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5), // مسافة أفقية صغيرة
        height: 100, // ارتفاع ثابت
        decoration: BoxDecoration(
          color: color, // لون خلفية الزر
          borderRadius: BorderRadius.circular(15), // حواف دائرية
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell( // InkWell لتأثير النقر
            borderRadius: BorderRadius.circular(15),
            onTap: () {
              print('Situation "$text" pressed!'); // طباعة عند الضغط
              // هنا يمكنك إضافة منطق خاص بالموقف المحدد (مثل فتح شاشة جديدة).
            },
            child: Column( // عمود لتنظيم الأيقونة والنص
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: Colors.white, size: 30), // أيقونة الموقف
                const SizedBox(height: 5),
                Text(
                  text,
                  textAlign: TextAlign.center, // توسيط النص إذا كان متعدد الأسطر
                  style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}