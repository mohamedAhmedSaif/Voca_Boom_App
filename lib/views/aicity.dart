import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AiCity(),
  ));
}

class AiCity extends StatefulWidget {
  @override
  _AiCityState createState() => _AiCityState();
}

class _AiCityState extends State<AiCity> {
  final List<Map<String, dynamic>> dialogue = [
    {
      "ai": "👋 Hello! Welcome to our lovely town. My name is Alex. What's your name?",
      "user": "أدخل اسمك", // هذا المفتاح ليس مستخدمًا بشكل مباشر في UI
    },
    {
      "ai": "Nice to meet you! Do you know what this is? 🏰 (Tower)",
      "question": {
        "type": "choose",
        "options": ["Tower", "Car", "Shop", "School"],
        "correct": "Tower"
      }
    },
    {
      "ai": "Correct! This is a tower. In our town, we have a big clock tower in the center.",
    },
    {
      "ai": "Now look at this 🚗. What is it?",
      "question": {
        "type": "choose",
        "options": ["Library", "Car", "Bridge", "Hospital"],
        "correct": "Car"
      }
    },
    {
      "ai": "Well done! Now, please write the sentence:",
      "question": {
        "type": "write",
        "hint": "I see a car in the street."
      }
    },
    {
      "ai": "🏫 What do you call this place where children go to study?",
      "question": {
        "type": "choose",
        "options": ["Hospital", "Market", "School", "House"],
        "correct": "School"
      }
    },
    {
      "ai": "Correct! It's a school. Our school has a beautiful garden.",
    },
    {
      "ai": "🛒 What is the name of the place where you buy food?",
      "question": {
        "type": "choose",
        "options": ["Shop", "Office", "Garage", "Bank"],
        "correct": "Shop"
      }
    },
    {
      "ai": "Nice! You can find everything in the town's shop.",
    },
    {
      "ai": "Please write the sentence:",
      "question": {
        "type": "write",
        "hint": "I go to the shop every day."
      }
    },
    {
      "ai": "🚶 Where do people walk?",
      "question": {
        "type": "choose",
        "options": ["Road", "Park", "Sidewalk", "River"],
        "correct": "Sidewalk"
      }
    },
    {
      "ai": "Yes! It's called a sidewalk.",
    },
    {
      "ai": "Now, type this sentence:",
      "question": {
        "type": "write",
        "hint": "I walk on the sidewalk."
      }
    },
    {
      "ai": "🛣️ What do cars drive on?",
      "question": {
        "type": "choose",
        "options": ["Bridge", "Sky", "Road", "Tree"],
        "correct": "Road"
      }
    },
    {
      "ai": "Correct! Roads connect different parts of the town.",
    },
    {
      "ai": "Please write this sentence:",
      "question": {
        "type": "write",
        "hint": "There are many cars on the road."
      }
    },
    {
      "ai": "🏥 Where do sick people go?",
      "question": {
        "type": "choose",
        "options": ["School", "Market", "Hospital", "Bank"],
        "correct": "Hospital"
      }
    },
    {
      "ai": "Great job! Hospitals help people get better.",
    },
    {
      "ai": "Lastly, try this sentence:",
      "question": {
        "type": "write",
        "hint": "I went to the hospital yesterday."
      }
    },
  ];

  int index = 0;
  int score = 0;
  String userInput = '';
  String userName = '';

  // Controller for the TextField to clear it programmatically
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void nextStep([String? answer]) {
    final current = dialogue[index];

    if (current.containsKey("question")) {
      final question = current["question"];
      if (question["type"] == "choose" && answer != null) {
        if (answer == question["correct"]) score++;
      } else if (question["type"] == "write") {
        if (userInput.trim().toLowerCase() == question["hint"].toString().trim().toLowerCase()) {
          score++;
        }
      }
    } else if (index == 0) { // No need for userInput.isNotEmpty here, as we handle name input
      userName = userInput;
    }

    setState(() {
      index++;
      userInput = ''; // Clear user input for the next step
      _textEditingController.clear(); // Clear the text field visually
    });
  }

  @override
  Widget build(BuildContext context) {
    if (index >= dialogue.length) {
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF8A2BE2), // Purple
                Color(0xFF4B0082), // Indigo
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("🎓 Great job, $userName!", style: TextStyle(fontSize: 26, color: Colors.white)),
                SizedBox(height: 10),
                Text("Your score: $score / ${dialogue.where((d) => d.containsKey('question')).length}",
                    style: TextStyle(fontSize: 20, color: Colors.white70)),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => setState(() {
                    index = 0;
                    score = 0;
                    userInput = '';
                    _textEditingController.clear(); // Clear controller on retry
                  }),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: Text("Try Again"),
                )
              ],
            ),
          ),
        ),
      );
    }

    final current = dialogue[index];
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.deepPurple,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pop(); // يرجع للصفحة السابقة
        },
      ),
    ),
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF8A2BE2),
              Color(0xFF4B0082),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // هذا هو الجزء الذي يعرض السؤال الأول (طلب الاسم)
                    if (index == 0) ...[
                      Text(
                        current["ai"],
                        style: TextStyle(fontSize: 18, color: Colors.black87),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: _textEditingController, // استخدام الـ controller هنا
                        onChanged: (val) => userInput = val,
                        decoration: InputDecoration(
                          hintText: "Your name...",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        ),
                      ),
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: () => nextStep(),
                          child: Text("Continue"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                          ),
                        ),
                      )
                    ]
                    // هذا هو الجزء الذي يعرض أسئلة الاختيار والكتابة
                    else if (current.containsKey("question"))
                      current["question"]["type"] == "choose"
                          ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(current["ai"], style: TextStyle(fontSize: 18, color: Colors.black87)),
                          SizedBox(height: 20),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 2.5,
                            ),
                            itemCount: (current["question"]["options"] as List<String>).length,
                            itemBuilder: (context, idx) {
                              final opt = (current["question"]["options"] as List<String>)[idx];
                              return ElevatedButton(
                                onPressed: () => nextStep(opt),
                                child: Text(opt, style: TextStyle(fontSize: 16)),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFFFC107),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 4,
                                ),
                              );
                            },
                          ),
                        ],
                      )
                          : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(current["ai"], style: TextStyle(fontSize: 18, color: Colors.black87)),
                          SizedBox(height: 20),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _textEditingController, // استخدام الـ controller هنا
                                    onChanged: (val) => userInput = val,
                                    decoration: InputDecoration(
                                      hintText: current["question"]["hint"],
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                    onPressed: () => nextStep(),
                                    child: Text("Save"),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFFFFC107),
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    // هذا هو الجزء الذي يعرض الحوارات العادية (بدون أسئلة أو حقول إدخال)
                    else // هنا عندما لا يكون index == 0 ولا يوجد "question"
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            current["ai"].replaceAll("{name}", userName),
                            style: TextStyle(fontSize: 18, color: Colors.black87),
                          ),
                          SizedBox(height: 20),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: ElevatedButton(
                              onPressed: () => nextStep(),
                              child: Text("Continue"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                              ),
                            ),
                          )
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}