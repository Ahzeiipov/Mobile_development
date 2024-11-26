import 'package:flutter/material.dart';
import 'model/quiz.dart';
import './model/submission.dart';
import './screens/question_screen.dart';
import './screens/result_screen.dart';
import './screens/welcome_screen.dart';

Color appColor = Colors.blue[500] as Color;

enum QuizState { notStarted, started, finished }

class QuizApp extends StatefulWidget {
  const QuizApp(this.quiz, {super.key});
  final Quiz quiz;

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  QuizState quizState = QuizState.notStarted;
  int currentQuestion = 0;
  Submission submission = Submission();
  void startQuiz() {
    setState(() {
      quizState = QuizState.started;
    });
  }
  // void startQuiz() {
  //   setState(() {
  //     quizState = QuizState.started;
  //     currentQuestion = 0; // Reset question index to the first question
  //     submission = Submission(); // Reset the submission (clear answers)
  //   });
  // }

  void finishQuiz() {
    setState(() {
      quizState = QuizState.finished;
    });
  }

  void goToNextQuestion() {
    currentQuestion++;
    setState(() {
      if (currentQuestion >= widget.quiz.questions.length) {
        quizState = QuizState.finished;
        // finishQuiz();
      }
    });
  }

  // Restart the quiz
  void restartQuiz() {
    setState(() {
      quizState = QuizState.notStarted;
    });
  }

//
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: appColor,
        body: Center(
          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text('TODO !'),
          //   ],
          // ),
          child: buildContent(),
        ),
      ),
    );
  }

  Widget buildContent() {
    switch (quizState) {
      case QuizState.notStarted:
        return buildStartScreen();
      case QuizState.started:
        return QuestionScreen(
          question: widget.quiz.questions[currentQuestion],
          onTap: goToNextQuestion,
        );
      case QuizState.finished:
        return ResultScreen(
          onStart: restartQuiz,
          quiz: widget.quiz,
          submission: submission,
        );
    }
  }

  Widget buildStartScreen() {
    return WelcomeScreen(
      onStart: startQuiz,
    );
  }
}
