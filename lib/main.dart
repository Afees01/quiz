import 'package:flutter/material.dart';
import 'package:quiz/question_screen/question_screeen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuestionScreeen(),
    );
  }
}
