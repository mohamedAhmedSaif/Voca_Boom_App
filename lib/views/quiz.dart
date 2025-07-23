import 'package:flutter/material.dart';
import 'package:voca_boom_app/views/Teacher_Page.dart';
import 'package:voca_boom_app/views/confirm_upload_video.dart';

void main() => runApp(QuizCreatorApp());

class QuizCreatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Quiz Creator',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: QuizDashboard(),
    );
  }
}

class QuizDashboard extends StatefulWidget {
  @override
  _QuizDashboardState createState() => _QuizDashboardState();
}

class _QuizDashboardState extends State<QuizDashboard> {
  final _formKey = GlobalKey<FormState>();

  String quizTitle = '';
  String selectedSubject = '';
  String selectedGrade = '';
  int selectedDuration = 30;

  List<Question> questions = [Question(index: 1)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => TeacherPage()));
          },
        ),
        title: Text("Create New Quiz"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Quiz Title'),
                validator: (value) =>
                value == null || value.isEmpty ? 'Please enter quiz title' : null,
                onChanged: (value) => quizTitle = value,
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Subject'),
                items: ['English'].map((subject) {
                  return DropdownMenuItem(value: subject, child: Text(subject));
                }).toList(),
                validator: (value) =>
                value == null || value.isEmpty ? 'Please select subject' : null,
                onChanged: (value) => selectedSubject = value ?? '',
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Grade'),
                items: List.generate(6, (i) => 'Grade ${i + 1}').map((grade) {
                  return DropdownMenuItem(value: grade, child: Text(grade));
                }).toList(),
                validator: (value) =>
                value == null || value.isEmpty ? 'Please select grade' : null,
                onChanged: (value) => selectedGrade = value ?? '',
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<int>(
                decoration: InputDecoration(labelText: 'Quiz Duration (minutes)'),
                value: selectedDuration,
                items: List.generate(60, (i) => i + 1).map((minute) {
                  return DropdownMenuItem(value: minute, child: Text('$minute'));
                }).toList(),
                validator: (value) =>
                value == null ? 'Please select duration' : null,
                onChanged: (value) => selectedDuration = value ?? 30,
              ),
              SizedBox(height: 20),

              // Questions
              ...questions.map((q) => QuestionWidget(
                key: ValueKey(q.index),
                question: q,
                onChanged: () => setState(() {}),
              )),
              SizedBox(height: 10),

              // Add Question Button
              AppElevatedButton(
                title: "Add New Question",
                onPressed: () {
                  setState(() {
                    questions.add(Question(index: questions.length + 1));
                  });
                },
              ),
              SizedBox(height: 20),

              // Create Quiz Button
              AppElevatedButton(
                title: "Create Quiz",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print("Quiz created with ${questions.length} questions.");
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Quiz created successfully!')),
                    );Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Confirm()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please fix the errors.')),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Question Model
class Question {
  final int index;
  TextEditingController questionController = TextEditingController();
  List<TextEditingController> optionControllers =
  List.generate(4, (_) => TextEditingController());
  int correctOptionIndex = 0;

  Question({required this.index});
}

// Question Widget
class QuestionWidget extends StatefulWidget {
  final Question question;
  final VoidCallback onChanged;

  const QuestionWidget(
      {super.key, required this.question, required this.onChanged});

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Question ${widget.question.index}",
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextFormField(
              controller: widget.question.questionController,
              decoration: InputDecoration(hintText: "Write the question here..."),
              validator: (val) =>
              val == null || val.trim().isEmpty ? 'Please enter the question' : null,
            ),
            SizedBox(height: 10),
            ...List.generate(4, (i) {
              return Row(
                children: [
                  Radio<int>(
                    value: i,
                    groupValue: widget.question.correctOptionIndex,
                    onChanged: (val) {
                      setState(() {
                        widget.question.correctOptionIndex = val!;
                        widget.onChanged();
                      });
                    },
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: widget.question.optionControllers[i],
                      decoration: InputDecoration(hintText: "Option ${i + 1}"),
                      validator: (val) =>
                      val == null || val.trim().isEmpty
                          ? 'Enter option ${i + 1}'
                          : null,
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}

// Custom Elevated Button Widget
class AppElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const AppElevatedButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
